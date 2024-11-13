FROM owasp/dependency-check:latest
SHELL ["/bin/bash", "-o", "pipefail", "-c"]
RUN /usr/share/dependency-check/bin/dependency-check.sh --updateonly
