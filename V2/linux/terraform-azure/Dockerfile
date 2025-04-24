FROM debian:bookworm as terraform
SHELL ["/bin/bash", "-o", "pipefail", "-c"]
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
    ca-certificates=* \
    curl=* \
    unzip=* \
    && rm -rf /var/lib/apt/lists/*
WORKDIR /
COPY versions versions
RUN chmod a+x ./versions && \
    version=$(./versions) && \
    curl -O "https://releases.hashicorp.com/terraform/${version}/terraform_${version}_linux_amd64.zip" -sk && \
    unzip -j "terraform_${version}_linux_amd64.zip"

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
RUN echo "deb [arch=amd64] https://packages.microsoft.com/repos/azure-cli/ $(lsb_release -cs) main" | \
    tee /etc/apt/sources.list.d/azure-cli.list
RUN apt-get update \
    && apt-get install -y --no-install-recommends azure-cli=* \
    && rm -rf /var/lib/apt/lists/*
    RUN curl -sL https://aka.ms/downloadazcopy-v10-linux | tar -xz -C /usr/local/bin --strip-components=1 \
    && chmod +x /usr/local/bin/azcopy
