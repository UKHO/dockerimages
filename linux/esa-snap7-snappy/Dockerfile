FROM ubuntu:xenial-20200326

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    software-properties-common=0.96.20.9 && \
    add-apt-repository ppa:deadsnakes/ppa && \
    apt-get update && \
    apt-get install -y --no-install-recommends \
    libpython3.6=3.6.10-1+xenial1 \
    openjdk-8-jre-headless=8u252-b09-1~16.04 \
    python3.6=3.6.10-1+xenial1 \
    python3-pip=8.1.1-2ubuntu0.4 \
    wget=1.17.1-1ubuntu1.5 && \
    rm -rf /var/lib/apt/lists/* && \
    python3.6 -m pip install --upgrade setuptools==46.3.0 wheel==0.34.2 

ENV JAVA_HOME /usr/lib/jvm/java-8-openjdk-amd64/
RUN export JAVA_HOME

RUN mkdir /opt/snap && \
    chmod +x /opt/snap -R && \
    wget -O /opt/snap/snap-setup.sh http://step.esa.int/downloads/7.0/installers/esa-snap_sentinel_unix_7_0.sh && \
    bash /opt/snap/snap-setup.sh -q -console -overwrite -dir /opt/snap && \
    mkdir /usr/lib/python3.6/dist-packages/ && \
    bash /opt/snap/bin/snappy-conf /usr/bin/python3.6 /usr/lib/python3.6/dist-packages/ && \
    rm /opt/snap/snap-setup.sh