FROM debian:stretch-20190708 as terraform
SHELL ["/bin/bash", "-o", "pipefail", "-c"]
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
    curl=* \
    unzip=* \
    && rm -rf /var/lib/apt/lists/*
RUN curl -O https://releases.hashicorp.com/terraform/0.12.17/terraform_0.12.17_linux_amd64.zip -sk
RUN unzip -j terraform_0.12.17_linux_amd64.zip

FROM debian:stretch-20190708-slim
COPY --from=terraform /terraform /usr/local/bin/terraform
SHELL ["/bin/bash", "-o", "pipefail", "-c"]
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
    ca-certificates=* \
    curl=* \
    apt-transport-https=* \
    lsb-release=* \
    gnupg=* \
    make=* \
    git-core=* \
    && rm -rf /var/lib/apt/lists/*
RUN curl -sL https://packages.microsoft.com/keys/microsoft.asc | \
    gpg --dearmor | \
    tee /etc/apt/trusted.gpg.d/microsoft.asc.gpg > /dev/null
RUN echo "deb [arch=amd64] https://packages.microsoft.com/repos/azure-cli/ $(lsb_release -cs) main" | \
    tee /etc/apt/sources.list.d/azure-cli.list
RUN apt-get update \
    && apt-get install -y --no-install-recommends azure-cli=* \
    && rm -rf /var/lib/apt/lists/*
