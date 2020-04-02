#!/usr/bin/env python
import base64
import json
from glob import glob
from os.path import dirname, join, expanduser, isfile
from pathlib import Path
from subprocess import run

import click
import requests

repository = "ukhydrographicoffice"
dockerfiles = glob(join("*", "Dockerfile"))


def targets():
    for dockerfile in dockerfiles:
        directory = dirname(dockerfile)
        versions = ["latest"]
        
        versions_script_path = join(directory, "versions")
        print(versions_script_path)
        if isfile(versions_script_path):
            output = run(["bash", versions_script_path], shell=True, text=True).stdout
            print(output)
            versions += output.splitlines()

        for version in versions:
            docker_image = f"{repository}/{directory}:{version}"
            yield dockerfile, directory, docker_image


@click.group(chain=True)
def cli():
    pass


@cli.command()
def build():
    for dockerfile, directory, docker_image in targets():
        f = "building: {docker_image}"
        print(f.format(docker_image=docker_image))
        f = "docker build --tag {docker_image} {directory}"
        run(f.format(docker_image=docker_image, directory=directory), shell=True)


@cli.command()
def lint():
    for dockerfile in dockerfiles:
        f = "linting: {dockerfile}"
        print(f.format(dockerfile=dockerfile))
        f = "docker run --rm -i hadolint/hadolint < {dockerfile}"
        run(f.format(dockerfile=dockerfile), shell=True)


@cli.command()
def ls():
    for dockerfile, directory, docker_image in targets():
        print(dockerfile, docker_image)


@cli.command()
def publish():
    for dockerfile, directory, docker_image in targets():
        f = "publishing: {docker_image}"
        print(f.format(docker_image=docker_image))
        f = "docker push {docker_image}"
        run(f.format(docker_image=docker_image), shell=True)

        readme = Path(join(directory, "README.md"))
        print(readme)
        if readme.is_file():
            print("has readme")
            update_readme(docker_image, readme.read_text())


def update_readme(docker_image, readme_contents):
    split = docker_image.split(':')[0]
    f = "https://hub.docker.com/v2/repositories/{split}/"
    response = requests.patch(
        f.format(split=split),
        data={"full_description": readme_contents},
        headers={"Authorization": "JWT " + jwt()},
    )
    if not response.ok:
        f = "Failed to update README for {split}"
        raise Exception(f.format(split=split))


def jwt():
    docker_config_path = expanduser(join("~", ".docker", "config.json"))

    with open(docker_config_path, "r") as docker_config_json:
        docker_config = json.load(docker_config_json)

    token = docker_config["auths"]["https://index.docker.io/v1/"]["auth"]

    [usr, pwd] = base64.b64decode(token).decode().split(":", 1)
    response = requests.post(
        "https://hub.docker.com/v2/users/login/",
        data={"username": usr, "password": pwd},
    )

    return response.json()["token"]


cli()
