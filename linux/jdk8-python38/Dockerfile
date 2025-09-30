FROM eclipse-temurin:8-jdk-jammy

SHELL ["/bin/bash", "-o", "pipefail", "-c"]

RUN apt-get update && \
    apt-get install -y software-properties-common=0.99.22.9 --no-install-recommends && \
    add-apt-repository ppa:deadsnakes/ppa && \
    apt-get install -y --no-install-recommends \
    git=1:2.34.1-1ubuntu1.15 \
    openssh-client=1:8.9p1-3ubuntu0.13 \
    python3-pip=22.0.2+dfsg-1ubuntu0.7 \
    python3.8=3.8.20-1+jammy1 \
    python3.8-distutils=3.8.20-1+jammy1 \
    unzip=6.0-26ubuntu3.2 \
    wget=1.21.2-2ubuntu1.1 \
    python3.8-dev=3.8.20-1+jammy1 \
    build-essential=12.9ubuntu3 \
  && ln -f -s /usr/bin/python3.8 /usr/bin/python3 \
  && rm -rf /var/lib/apt/lists/* \
  && pip3 install --no-cache-dir setuptools==75.3.2 wheel==0.45.1 \
  && pip3 install --no-cache-dir awscli==1.38.38 \
  && curl -L -O https://amazon-ecr-credential-helper-releases.s3.us-east-2.amazonaws.com/0.9.0/linux-amd64/docker-credential-ecr-login \
  && chmod +x ./docker-credential-ecr-login \
  && mv ./docker-credential-ecr-login /usr/local/bin/
