# Docker Images

## About

This is a repository to contain various Docker Images

Dockerfiles should conform to [best practices](https://docs.docker.com/develop/develop-images/dockerfile_best-practices/)

## How to add a Docker Image

Create a directory and put the `Dockerfile` and a `README.md` in it (the `README.md` can be blank but __must__ exist)

Note: The Docker Image will be named the same as the directory

The build tool (`./pleasew`) will then pick it up and do the rest, that simple!

You can verify it's being picked up by running `./pleasew query alltargets`

## [please build](https://please.build)

`./pleasew` is a wrapper that handles installation and version management. `please` commands can be run using it e.g. `./pleasew build`.

`please` is configured to search the top level directories and identify the ones containing a `Dockerfile` and uses those for the subsequent commands

### Lint

Run using `./pleasew test`

Lints the Dockerfiles for good practices using [hadolint](https://github.com/hadolint/hadolint)

### Build

Run using `./pleasew run //:build`

Builds the Docker images, but does not push them

### Publish

__Intended for CI__

Run using `./pleasew run //:publish`

Builds and pushes the Docker images:
- `{docker repository from BUILD}/{directory}:{short git commit hash of HEAD}`
