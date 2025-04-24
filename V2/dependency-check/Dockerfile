FROM owasp/dependency-check:latest
USER root
RUN mkdir /usr/share/dependency-check/data/cache
# Debug: Check permissions of the secret
RUN --mount=type=secret,id=nvdapikey \
    ls -l /run/secrets/nvdapikey && \
    cat /run/secrets/nvdapikey

# Run the dependency-check script with the secret
RUN --mount=type=secret,id=nvdapikey \
    /usr/share/dependency-check/bin/dependency-check.sh --updateonly --nvdApiKey "$(cat /run/secrets/nvdapikey)"
