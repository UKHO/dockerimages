#!/usr/bin/env python
import base64
import json
from glob import glob
from os.path import basename, dirname, expanduser, isfile, join
from pathlib import Path
from typing import List, Union

import click
import requests

ostype = "*"
repository = "ukhydrographicoffice"
dockerfiles = glob(join(ostype, "**", "Dockerfile"))


def targets():
    print("loading targets")
    for dockerfile in dockerfiles:
        directory = dirname(dockerfile)
        print(f"getting target: {directory}")
        versions = ["latest"]

        versions_script_path = join(directory, "versions")
        if isfile(versions_script_path):
            output = run(["bash", versions_script_path])
            versions += output.splitlines()

        for version in versions:
            name = basename(directory)
            docker_image = f"{repository}/{name}:{version}"
            yield dockerfile, directory, docker_image


@click.group(chain=True)
def cli():
    pass

@cli.command()
def win():
    global dockerfiles

    ostype = "win"
    dockerfiles = glob(join(ostype, "*", "Dockerfile"))

@cli.command()
def linux():
    global dockerfiles

    ostype = "linux"
    dockerfiles = glob(join(ostype, "*", "Dockerfile"))


@cli.command()
def build():
    for dockerfile, directory, docker_image in targets():
        print(f"building: {docker_image}")
        docker(f"build --force-rm --tag {docker_image} {directory}")
        print(f"built: {docker_image}")


@cli.command()
def lint():
    for dockerfile in dockerfiles:
        print(f"linting: {dockerfile}")
        docker(f"run --rm -i hadolint/hadolint < {dockerfile}")
        print(f"linted: {dockerfile}")


@cli.command()
def ls():
    for dockerfile, directory, docker_image in targets():
        print(dockerfile, docker_image)


@cli.command()
def publish():
    for dockerfile, directory, docker_image in targets():
        print(f"publishing: {docker_image}")
        docker(f"push {docker_image}")
        print(f"published: {docker_image}")

        readme = Path(join(directory, "README.md"))
        if readme.is_file():
            print(f"publishing: {readme}")
            update_readme(docker_image, readme.read_text())
            print(f"published: {readme}")


def update_readme(docker_image, readme_contents):
    split = docker_image.split(":")[0]

    response = requests.patch(
        f"https://hub.docker.com/v2/repositories/{split}/",
        data={"full_description": readme_contents},
        headers={"Authorization": "JWT " + jwt()},
    )
    if not response.ok:
        raise Exception(
            f"Failed to update README for {split}:", response.reason, response.content
        )


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


def docker(command: str):
    cmd = f"docker {command}"
    print("$", cmd)
    run(cmd)


def run(cmd: Union[str, List[str]]) -> str:
    from subprocess import run, STDOUT, PIPE

    if type(cmd) == str:
        p = run(cmd, stdout=PIPE, stderr=STDOUT, universal_newlines=True, shell=True)
    elif type(cmd) == list:
        p = run(cmd, stdout=PIPE, stderr=STDOUT, universal_newlines=True)

    output = p.stdout

    if p.returncode != 0:
        print(output)
        exit(1)

    return output


cli()
