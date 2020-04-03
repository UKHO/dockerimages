#!/usr/bin/env python
import base64
import json
from glob import glob
from os.path import dirname, join, expanduser, isfile
from pathlib import Path
from subprocess import run

import click
import requests
import subprocess

repository = "ukhydrographicoffice"
dockerfiles = glob(join("*", "Dockerfile"))


def targets():
    for dockerfile in dockerfiles:
        directory = dirname(dockerfile)
        versions = ["latest"]

        versions_script_path = join(directory, "versions")
        print(versions_script_path)
        if isfile(versions_script_path):
            output = subprocess.run(["bash", versions_script_path], stdout=subprocess.PIPE, universal_newlines=True).stdout
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
        print(f"building: {docker_image}")
        run(f"docker build --tag {docker_image} {directory}", shell=True)
        print(f"built: {docker_image}")    


@cli.command()
def lint():
    for dockerfile in dockerfiles:
        print(f"linting: {dockerfile}")
        run(f"docker run --rm -i hadolint/hadolint < {dockerfile}", shell=True)

@cli.command()
def ls():
    for dockerfile, directory, docker_image in targets():
        print(dockerfile, docker_image)


@cli.command()
def publish():
    for dockerfile, directory, docker_image in targets():
        print(f"publishing: {docker_image}")
        run(f"docker push {docker_image}", shell=True)

        readme = Path(join(directory, "README.md"))
        print(readme)
        if readme.is_file():
            print("has readme")
            update_readme(docker_image, readme.read_text())


def update_readme(docker_image, readme_contents):
    split = docker_image.split(':')[0]

    response = requests.patch(
        f"https://hub.docker.com/v2/repositories/{split}/",
        data={"full_description": readme_contents},
        headers={"Authorization": "JWT " + jwt()},
    )
    if not response.ok:
        raise Exception(f"Failed to update README for {split}")


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
