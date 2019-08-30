# Docker Images

## About

This is a repository to contain various base Docker Images

Dockerfiles should conform to [best practices](https://docs.docker.com/develop/develop-images/dockerfile_best-practices/)

## Makefile

The Makefile searches for directories containing a file named `Dockerfile` and uses those for the subsequent commands

By default running `make` will run [lint](#Lint) [build](#Build)

It has been written to be idempotent so it will consistently fail/succeed

### Lint

Run with `make lint`

Lints the Dockerfiles for good practices using [hadolint](https://github.com/hadolint/hadolint)

Produces a `.LINT.DONE` file in the same directory as the Dockerfile

### Build

Run with `make build`

Builds the Docker images, but does not push them

Produces a `.BUILD.DONE` file in the same directory as the Dockerfile
