#!/usr/bin/env python
import base64
import json
from glob import glob
from os.path import dirname, join, expanduser
from pathlib import Path
from subprocess import run

import click
import requests

repository = "ukhydrographicoffice"
dockerfiles = glob(join("*", "Dockerfile"))


def targets():
    for dockerfile in dockerfiles:
        name = dirname(dockerfile)
        versions = ["latest"]
        for version in versions:
            image = "{repository}/{name}:{version}"
            docker_image = image.format(repository=repository, name=name, version=version)
        
            yield dockerfile, name, docker_image


@click.group(chain=True)
def cli():
    pass


@cli.command()
def build():
    for dockerfile, directory, docker_image in targets():
        print(f"building: {docker_image}")
        run(f"docker build --tag {docker_image} {directory}", shell=True)


@cli.command()
def lint():
    for dockerfile in dockerfiles:
        print(f"linting: {dockerfile}")
        run(f"docker run --rm -i hadolint/hadolint < {dockerfile}", shell=True)


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


def update_readme(docker_image: str, readme_contents: str):
    response = requests.patch(
        f"https://hub.docker.com/v2/repositories/{docker_image.split(':')[0]}/",
        data={"full_description": readme_contents},
        headers={"Authorization": "JWT " + jwt()},
    )
    if not response.ok:
        raise Exception(f"Failed to update README for {docker_image.split(':')[0]}")


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