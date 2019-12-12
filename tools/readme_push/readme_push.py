import argparse
import base64
import json
import os.path
import requests
import sys

def parse_args():
    parser = argparse.ArgumentParser(
        description = "push a README to a docker image repository",
    )
    parser.add_argument(
        "repository",
        type=str,
        help="Docker image repository e.g. ukhydrographicoffice",
    )
    parser.add_argument(
        "image",
        type=str,
        help="Docker image name e.g. awscli",
    )
    parser.add_argument(
        "readme",
        type=str,
        help="Path to README e.g. ./README.md",
    )
    return parser.parse_args()


def main():
    args = parse_args()

    with open(args.readme, "r") as readme:
        response = requests.patch(
            "https://hub.docker.com/v2/repositories/" + args.repository + "/" + args.image + "/",
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

if __name__ == "__main__":
    main()
