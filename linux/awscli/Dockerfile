FROM python:3.12-alpine

RUN pip3 install --no-cache-dir --upgrade awscli==1.42.42 && \
    apk add --no-cache groff=*

ENTRYPOINT ["aws"]
