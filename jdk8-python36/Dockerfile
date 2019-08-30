FROM adoptopenjdk:8-jdk-hotspot

RUN apt-get update && apt-get install -y --no-install-recommends \
    git=* \
    openssh-client=* \
    python3.6=* \
    python3-pip=* \
    unzip=* \
    wget=* \
  && rm -rf /var/lib/apt/lists/*
