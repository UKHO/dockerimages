FROM owasp/dependency-check:latest
RUN mkdir /usr/share/dependency-check/data/cache
RUN --mount=type=secret,id=nvdapikey \
    source /run/secrets/nvdapikey && \
    /usr/share/dependency-check/bin/dependency-check.sh --updateonly --nvdapikey $NVDAPIKEY
