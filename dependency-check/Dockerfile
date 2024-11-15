FROM owasp/dependency-check:latest
RUN mkdir /usr/share/dependency-check/data/cache
RUN --mount=type=secret,id=nvdapikey \
    cat /run/secrets/nvdapikey && \
    /usr/share/dependency-check/bin/dependency-check.sh --updateonly --nvdapikey "$(cat /run/secrets/nvdapikey)"
