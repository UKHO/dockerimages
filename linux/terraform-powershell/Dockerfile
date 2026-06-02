FROM debian:bookworm AS terraform
ARG TERRAFORM_VERSION
SHELL ["/bin/bash", "-o", "pipefail", "-c"]
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
    ca-certificates=* \
    curl=* \
    unzip=* \
    && rm -rf /var/lib/apt/lists/*
WORKDIR /
RUN curl -O "https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip" -sk && \
    unzip -j "terraform_${TERRAFORM_VERSION}_linux_amd64.zip"
    
FROM debian:bookworm-slim
COPY --from=terraform /terraform /usr/local/bin/terraform
SHELL ["/bin/bash", "-o", "pipefail", "-c"]
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
    ca-certificates=* \
    curl=* \
    apt-transport-https=* \
    lsb-release=* \
    gnupg=* \
    git=* \
    && rm -rf /var/lib/apt/lists/*
RUN curl -sL https://packages.microsoft.com/keys/microsoft.asc | \
    gpg --dearmor | \
    tee /etc/apt/trusted.gpg.d/microsoft.asc.gpg > /dev/null
RUN sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/microsoft-debian-bookworm-prod/ bookworm main" > /etc/apt/sources.list.d/microsoft.list' \
    && apt-get update \
    && apt-get install -y --no-install-recommends powershell=* \    
    && rm -rf /var/lib/apt/lists/*
