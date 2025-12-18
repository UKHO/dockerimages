FROM dhi.io/debian-base:trixie
SHELL ["/bin/bash", "-o", "pipefail", "-c"]
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
    curl=* \
    && rm -rf /var/lib/apt/lists/*
RUN curl -sL https://aka.ms/InstallAzureCLIDeb | bash
RUN az extension add --name azure-devops
