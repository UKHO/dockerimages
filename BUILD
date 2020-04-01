#!/usr/bin/env python3
import base64
import json
import os.path
import requests
import sys
import click

@click.group(chain=True)
def cli():
    pass

repo = "ukhydrographicoffice"
dockerfiles = glob(["*/Dockerfile"])
versions = ["latest"]

from subprocess import run

@cli.command()
def build():
    directory = dirname(dockerfile)
    docker_image = f"{repo}/{directory}"
    run(f"docker build --tag {docker_image} {directory}")

@cli.command()
def lint():
    docker_image = f"{repo}/{directory}"
    run(f"docker run --rm -i hadolint/hadolint < {docker_image}")

@cli.command()
def publish():
    run(f"docker push {docker_image}")

    with open(readme, "r") as readme:
        response = requests.patch(
            "https://hub.docker.com/v2/repositories/" + repository + "/" + image + "/",
            data = { "full_description": readme.read() },
            headers = { "Authorization": "JWT " + jwt() },
        )

    if response.ok:
        sys.exit(0)
    else:
        sys.exit(1)

def jwt():
    docker_config_path = os.path.expanduser("~/.docker/config.json")

    with open(docker_config_path, "r") as docker_config_json:
        docker_config = json.load(docker_config_json)

    token = docker_config["auths"]["https://index.docker.io/v1/"]["auth"]

    [usr, pwd] = base64.b64decode(token).decode().split(":", 1)
    response = requests.post(
        "https://hub.docker.com/v2/users/login/",
        data = { "username": usr, "password": pwd },
    )

    return response.json()["token"]

cli()