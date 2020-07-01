FROM debian:stretch-20190708 as terraform
SHELL ["/bin/bash", "-o", "pipefail", "-c"]
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
    ca-certificates=* \
    curl=* \
    unzip=* \
    && rm -rf /var/lib/apt/lists/*
RUN version=$(./versions) && \
    curl -O "https://releases.hashicorp.com/terraform/${version}/terraform_${version}_linux_amd64.zip" -sk && \
    unzip -j "terraform_${version}_linux_amd64.zip"

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
    git-core=* \
    && rm -rf /var/lib/apt/lists/*
