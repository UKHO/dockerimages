FROM dhi.io/debian-base:trixie-dev AS terraform
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

FROM dhi.io/debian-base:trixie-dev
COPY --from=terraform /terraform /usr/local/bin/terraform
SHELL ["/bin/bash", "-o", "pipefail", "-c"]
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
    curl=* \
    git=*\
    passwd=*
RUN curl -sL https://aka.ms/InstallAzureCLIDeb | bash
RUN curl -sL https://aka.ms/downloadazcopy-v10-linux | tar -xz -C /usr/local/bin --strip-components=1 \
    && chmod +x /usr/local/bin/azcopy
