# awscli

## Purpose
Encapsulated AWS CLI container with `aws` as the entrypoint for direct command execution.

## Installed dependencies
| Dependency | Version | Notes |
|---|---|---|
| Python | 3.12 | From base image `python:3.12-alpine` |
| AWS CLI | 1.38.26 | Installed via `pip3` |
| groff | distro package | Installed via `apk` |

## How to use

This image expects the environment variables `AWS_ACCESS_KEY_ID`, `AWS_SECRET_ACCESS_KEY`, and `AWS_DEFAULT_REGION` to be available

An example invocation is:

```
$ docker run --name awscli \
-e "AWS_ACCESS_KEY_ID=<id here>" \
-e "AWS_SECRET_ACCESS_KEY=<access key here>" \
-e "AWS_DEFAULT_REGION=<region here>" \
ukhydrographicoffice/awscli \
s3 ls
```

This is quite verbose, so we recommend aliasing the command:

`~/.bash_profile`:
```
alias run_aws_cli='docker run --name awscli \
-e "AWS_ACCESS_KEY_ID=<id here>" \
-e "AWS_SECRET_ACCESS_KEY=<access key here>" \
-e "AWS_DEFAULT_REGION=<region here>" \
ukhydrographicoffice/awscli '
```

Then using it with:
```
$ run_aws_cli s3 ls
```
