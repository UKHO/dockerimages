# awscli
This image provides an encapsulated environment to execute `awscli` commands without the need to install 
Python and various dependencies

|Technology/Library|Version |
|------------------|--------|
|Python            |3.12    |
|awscli            |1.38.26 |

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
