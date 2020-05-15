FROM ubuntu:xenial-20200326

# Install system dependencies
RUN apt-get update && \
    apt-get install -y software-properties-common wget

# # Install Java
RUN apt-get install -y openjdk-8-jre-headless
ENV JAVA_HOME /usr/lib/jvm/java-8-openjdk-amd64/
RUN export JAVA_HOME

# Install Python
RUN add-apt-repository ppa:deadsnakes/ppa && \
    apt-get update && \
    apt-get install -y python3.6 python3-pip libpython3.6 && \
    python3.6 -m pip install --upgrade setuptools wheel

# Install SNAP and setup snappy
RUN mkdir /opt/snap && \
    chmod +x /opt/snap -R && \
    wget -O /opt/snap/snap-setup.sh http://step.esa.int/downloads/7.0/installers/esa-snap_sentinel_unix_7_0.sh && \
    bash /opt/snap/snap-setup.sh -q -console -overwrite -dir /opt/snap && \
    mkdir /usr/lib/python3.6/dist-packages/ && \
    bash /opt/snap/bin/snappy-conf /usr/bin/python3.6 /usr/lib/python3.6/dist-packages/