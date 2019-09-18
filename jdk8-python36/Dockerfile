FROM adoptopenjdk:8-jdk-hotspot

RUN apt-get update && apt-get install -y --no-install-recommends \
    git=* \
    openssh-client=* \
    pbzip2=* \
    python3-pip=* \
    python3.6=* \
    unzip=* \
    wget=* \
  && rm -rf /var/lib/apt/lists/*
