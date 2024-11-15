FROM owasp/dependency-check:latest
RUN mkdir /usr/share/dependency-check/data/cache                                                           && \
    chown -R ${user}:0 /usr/share/dependency-check
RUN source /usr/share/dependency-check/bin/dependency-check.sh --updateonly
