FROM eclipse-temurin:8-jdk-jammy

SHELL ["/bin/bash", "-o", "pipefail", "-c"]

RUN apt-get update && apt-get install -y --no-install-recommends \
    git=* \
    openssh-client=* \
    python3-pip=* \
    python3.8=* \
    unzip=* \
    wget=* \
    python3.8-dev=* \
    build-essential=* \
  && ln -f -s /usr/bin/python3.8 /usr/bin/python3 \
  && rm -rf /var/lib/apt/lists/* \
  && pip3 install --no-cache-dir setuptools==75.6.0 wheel==0.45.1 \
  && pip3 install --no-cache-dir awscli==1.35.91 \
  && curl -L -O https://amazon-ecr-credential-helper-releases.s3.us-east-2.amazonaws.com/0.9.0/linux-amd64/docker-credential-ecr-login \
  && chmod +x ./docker-credential-ecr-login \
  && mv ./docker-credential-ecr-login /usr/local/bin/
