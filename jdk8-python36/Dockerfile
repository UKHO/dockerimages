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
  && rm -rf /var/lib/apt/lists/*
