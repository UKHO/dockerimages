# aws

## Purpose
General-purpose AWS tooling container with no fixed entrypoint, so custom commands/scripts can be run directly.

## Installed dependencies
| Dependency | Version | Notes |
|---|---|---|
| Python | 3.12 | From base image `python:3.12-alpine` |
| AWS CLI | 1.38.26 | Installed via `pip3` |
| groff | distro package | Installed via `apk` |

## How to use

This image expects the environment variables `AWS_ACCESS_KEY_ID`, `AWS_SECRET_ACCESS_KEY`, and `AWS_DEFAULT_REGION` to be available.
