FROM mcr.microsoft.com/dotnet/core/runtime:3.1 as coverity
SHELL ["/bin/bash", "-o", "pipefail", "-c"]
ENV AZURE_DEVOPS_EXT_PAT="fgujczzic5nkd5kdym4ojdrvkn56hilkt47koh2lkm7sklmy7gta"
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
    ca-certificates=* \
    curl=* \
    apt-transport-https=* \
    lsb-release=* \
    gnupg=* \
    && rm -rf /var/lib/apt/lists/*
RUN curl -sL https://packages.microsoft.com/keys/microsoft.asc | \
    gpg --dearmor | \
    tee /etc/apt/trusted.gpg.d/microsoft.asc.gpg > /dev/null
RUN echo "deb [arch=amd64] https://packages.microsoft.com/repos/azure-cli/ $(lsb_release -cs) main" | \
    tee /etc/apt/sources.list.d/azure-cli.list
RUN apt-get update \
    && apt-get install -y --no-install-recommends azure-cli=* \
    && rm -rf /var/lib/apt/lists/*
RUN az extension add --name azure-devops
RUN az artifacts universal download \
    --organization "https://ukhogov.visualstudio.com/" \
    --feed "ukhoget" \
    --name "cov-analysis-linux64-2019.12" \
    --version "2019.12.0" \
    --path /tmp
RUN tar -xvf "/tmp/cov-analysis-linux64-2019.12.tar.gz" -C /usr/local/bin

FROM adoptopenjdk:8-jdk-hotspot
SHELL ["/bin/bash", "-o", "pipefail", "-c"]
RUN curl -sL https://deb.nodesource.com/setup_10.x | bash - \
    && curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
    && echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list \
    && apt-get update && apt-get install -y --no-install-recommends \
    git=* \
    nodejs=* \
    openssh-client=* \
    pbzip2=* \
    python3-pip=* \
    python3.6=* \
    unzip=* \
    wget=* \
    yarn=* \
    python3.6-dev=* \
    build-essential=* \
  && rm -rf /var/lib/apt/lists/* \
  && pip3 install setuptools==41.6.0 wheel==0.33.6 \
  && pip3 install awscli==1.16.277 \
  && curl -L -O https://amazon-ecr-credential-helper-releases.s3.us-east-2.amazonaws.com/0.4.0/linux-amd64/docker-credential-ecr-login \
  && chmod +x ./docker-credential-ecr-login \
  && mv ./docker-credential-ecr-login /usr/local/bin/
COPY --from=coverity /usr/local/bin/cov-analysis-linux64-2019.12 /usr/local/bin/cov-analysis-linux64-2019.12
ENV COVERITY_TOOL_HOME=/usr/local/bin/cov-analysis-linux64-2019.12
ENV PATH=${PATH}:${COVERITY_TOOL_HOME}/bin
