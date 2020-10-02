FROM mcr.microsoft.com/dotnet/core/sdk:3.1-bionic
SHELL ["/bin/bash", "-o", "pipefail", "-c"]
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
    zip=* \
    && rm -rf /var/lib/apt/lists/*
