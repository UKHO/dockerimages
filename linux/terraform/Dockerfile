<<<<<<< HEAD
FROM dhi.io/debian-base:trixie-dev AS terraform
=======
FROM debian:bookworm AS terraform
>>>>>>> parent of c8aabf7 (Update terraform container to hardened image (#106))
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

<<<<<<< HEAD
FROM dhi.io/debian-base:trixie-dev
=======
FROM debian:bookworm-slim
>>>>>>> parent of c8aabf7 (Update terraform container to hardened image (#106))
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
<<<<<<< HEAD

# Create AzDevOps_azpcontainer user and add to sudoers as crashes when run in pipeline
RUN echo '%azure_pipelines_sudo ALL=(ALL:ALL) NOPASSWD:ALL' >> /etc/sudoers && \
    ln -sf /usr/bin/true /usr/bin/su  && \
    ln -sf /usr/bin/true /usr/sbin/groupadd  && \
    ln -sf /usr/bin/true /usr/sbin/usermod
=======
>>>>>>> parent of c8aabf7 (Update terraform container to hardened image (#106))
