FROM ukhydrographicoffice/aardvarkcov:2019.12 as coverity

FROM debian:10.4-slim as node10
SHELL ["/bin/bash", "-o", "pipefail", "-c"]
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
    wget=* \
    nodejs=* \
    npm=* \
    ca-certificates=* \
    apt-transport-https=* \
    && rm -rf /var/lib/apt/lists/*
RUN wget https://packages.microsoft.com/config/debian/10/packages-microsoft-prod.deb \
    && dpkg -i packages-microsoft-prod.deb \ 
    && apt-get update \
    && apt-get install -y --no-install-recommends \
    powershell=* \
    && rm -rf /var/lib/apt/lists/*
COPY --from=coverity /usr/local/bin/cov-analysis-linux64-2019.12 /usr/local/bin/cov-analysis-linux64-2019.12
ENV COVERITY_TOOL_HOME=/usr/local/bin/cov-analysis-linux64-2019.12
ENV PATH=${PATH}:${COVERITY_TOOL_HOME}/bin
