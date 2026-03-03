# jdk8-python38

## Purpose
Build image for Java 8 and Python 3.8 workflows, including legacy AWS tooling support.

## Installed dependencies
| Dependency | Version | Notes |
|---|---|---|
| OpenJDK | 8 | From base image `adoptopenjdk:8-jdk-hotspot` |
| Python | 3.8 | Installed via Debian package `python3.8` |
| AWS CLI | 1.16.277 | Installed via `pip3` |
| setuptools | 41.6.0 | Installed via `pip3` |
| wheel | 0.33.6 | Installed via `pip3` |
| Docker ECR credential helper | 0.4.0 | Binary `docker-credential-ecr-login` |
| System packages | distro packages | Includes `git`, `openssh-client`, `python3-pip`, `python3.8-dev`, `build-essential`, `unzip`, `wget` |

