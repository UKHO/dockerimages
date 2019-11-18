# Docker Images

## About

This is a repository to contain various Docker Images

Dockerfiles should conform to [best practices](https://docs.docker.com/develop/develop-images/dockerfile_best-practices/)

## How to add a Docker Image

Create a directory and put the Dockerfile in it

Note: The Docker Image will be named the same as the directory

The Makefile will then pick it up and do the rest, that simple!

You can verify it's being picked up by running [`make list`](#List)

## Makefile

The Makefile searches for directories containing a file named `Dockerfile` and uses those for the subsequent commands

By default running `make` will run [lint](#Lint) and [build](#Build)

It has been written to be idempotent so it will consistently fail/succeed

### List

Run using `make list`

Displays the list of Dockerfiles that will be used by other commands

This can be used to verify that a new Dockerfile has been added correctly

### Lint

Run using `make lint`

Lints the Dockerfiles for good practices using [hadolint](https://github.com/hadolint/hadolint)

Produces a `.LINT.DONE` file in the same directory as the Dockerfile

### Build

Run using `make build`

Builds the Docker images, but does not push them

Produces a `.BUILD.DONE` file in the same directory as the Dockerfile

### Push

Run using `make push`

Builds and pushes the Docker images:
- `{docker repository from Makefile}/{directory}:latest`
- `{docker repository from Makefile}/{directory}:{git commit hash of HEAD}`

Produces a `.PUSH.DONE` file in the same directory as the Dockerfile
