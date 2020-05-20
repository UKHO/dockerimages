FROM ukhydrographicoffice/aardvarkcov:2019.12 as coverity

FROM maven:3.6.1-jdk-8
SHELL ["/bin/bash", "-o", "pipefail", "-c"]
RUN curl -sL https://deb.nodesource.com/setup_10.x | bash - \
    && curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
    && echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list \
    && apt-get update && apt-get install -y --no-install-recommends \
    git=* \
    && rm -rf /var/lib/apt/lists/*
RUN curl -sLO https://packages.microsoft.com/config/ubuntu/18.04/packages-microsoft-prod.deb \
    && dpkg -i packages-microsoft-prod.deb \
    && apt-get update \
    && apt-get install --no-install-recommends -y powershell=* \
    && rm -rf /var/lib/apt/lists/*
COPY --from=coverity /usr/local/bin/cov-analysis-linux64-2019.12 /usr/local/bin/cov-analysis-linux64-2019.12
ENV COVERITY_TOOL_HOME=/usr/local/bin/cov-analysis-linux64-2019.12
ENV PATH=${PATH}:${COVERITY_TOOL_HOME}/bin
