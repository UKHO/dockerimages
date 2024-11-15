FROM owasp/dependency-check:latest
RUN --mount=type=secret,id=nvdapikey cat /run/secrets/nvdapikey > /tmp/secret.txt
RUN mkdir /usr/share/dependency-check/data/cache
RUN /usr/share/dependency-check/bin/dependency-check.sh --updateonly --nvdapikey $NVDAPIKEY
