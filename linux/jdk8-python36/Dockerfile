FROM adoptopenjdk:8-jdk-hotspot

ENV LD_LIBRARY_PATH "${LD_LIBRARY_PATH}:/usr/lib/:/usr/lib/jni/"

SHELL ["/bin/bash", "-o", "pipefail", "-c"]
RUN apt-get update && apt-get install -y --no-install-recommends \
    git=* \
    openssh-client=* \
    pbzip2=* \
    python3-pip=* \
    python3.6=* \
    unzip=* \
    wget=* \
    python3.6-dev=* \
    build-essential=* \
    gdal-bin=* \
    libgdal-java=* \
  && rm -rf /var/lib/apt/lists/* \
  && pip3 install setuptools==41.6.0 wheel==0.33.6 \
  && pip3 install awscli==1.16.277 \
  && curl -L -O https://amazon-ecr-credential-helper-releases.s3.us-east-2.amazonaws.com/0.4.0/linux-amd64/docker-credential-ecr-login \
  && chmod +x ./docker-credential-ecr-login \
  && mv ./docker-credential-ecr-login /usr/local/bin/
