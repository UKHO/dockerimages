FROM dhi.io/debian-base:trixie-dev
SHELL ["/bin/bash", "-o", "pipefail", "-c"]
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
    curl=* 
RUN curl -sL https://aka.ms/InstallAzureCLIDeb | bash
