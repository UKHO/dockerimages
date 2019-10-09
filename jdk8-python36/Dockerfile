FROM adoptopenjdk:8-jdk-hotspot

RUN  curl -sL https://deb.nodesource.com/setup_8.x | bash - \
    && apt-get update && apt-get install -y --no-install-recommends \
    git=* \
    nodejs=* \
    openssh-client=* \
    pbzip2=* \
    python3-pip=* \
    python3.6=* \
    unzip=* \
    wget=* \
  && rm -rf /var/lib/apt/lists/*
