# Docker Images

## About

This is a repository to contain various Docker Images

Dockerfiles should conform to [best practices](https://docs.docker.com/develop/develop-images/dockerfile_best-practices/)

## How to add a Docker Image

Create a directory containing a `Dockerfile` and optionally a `README.md`

Note: The Docker Image will be named the same as the directory

The custom build tool will then pick it up and do the rest, that simple!

You can verify it's being picked up by running `./runner ls`

### Lint

Run using `./runner lint`

Lints the Dockerfiles for good practices using [hadolint](https://github.com/hadolint/hadolint)

### Build

Run using `./runner build`

Builds the Docker images, but does not push them

### Publish

__Intended for CI__

Run using `./runner build publish`

Builds and pushes the Docker images:
- `{docker repository from BUILD}/{parent directory}:{latest}`
