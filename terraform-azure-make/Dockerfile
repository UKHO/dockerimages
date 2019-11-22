FROM debian:stretch-20190708 as terraform
SHELL ["/bin/bash", "-o", "pipefail", "-c"]
RUN apt-get update
RUN apt-get install -y curl=* unzip=*
RUN curl -O https://releases.hashicorp.com/terraform/0.12.9/terraform_0.12.9_linux_amd64.zip
RUN unzip -j terraform_0.12.9_linux_amd64.zip

FROM debian:stretch-20190708-slim
SHELL ["/bin/bash", "-o", "pipefail", "-c"]
RUN apt-get update && apt-get install -y make curl apt-transport-https lsb-release gnupg git-core
RUN curl -sL https://packages.microsoft.com/keys/microsoft.asc | \
    gpg --dearmor | \
    tee /etc/apt/trusted.gpg.d/microsoft.asc.gpg > /dev/null
RUN echo "deb [arch=amd64] https://packages.microsoft.com/repos/azure-cli/ $(lsb_release -cs) main" | \
    tee /etc/apt/sources.list.d/azure-cli.list
RUN apt-get update && apt-get install -y azure-cli=*
COPY --from=terraform /terraform /usr/local/bin/terraform
