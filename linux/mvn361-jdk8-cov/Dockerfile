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

FROM maven:3.6.1-jdk-8
SHELL ["/bin/bash", "-o", "pipefail", "-c"]
RUN curl -sL https://deb.nodesource.com/setup_10.x | bash - \
    && curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
    && echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list \
    && apt-get update && apt-get install -y --no-install-recommends \
    git=* \
    && rm -rf /var/lib/apt/lists/*
COPY --from=coverity /usr/local/bin/cov-analysis-linux64-2019.12 /usr/local/bin/cov-analysis-linux64-2019.12
ENV COVERITY_TOOL_HOME=/usr/local/bin/cov-analysis-linux64-2019.12
ENV PATH=${PATH}:${COVERITY_TOOL_HOME}/bin