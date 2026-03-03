FROM dhi.io/debian-base:trixie-dev
SHELL ["/bin/bash", "-o", "pipefail", "-c"]
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
    curl=* 
RUN curl -sL https://aka.ms/InstallAzureCLIDeb | bash

# Create AzDevOps_azpcontainer user and add to sudoers as crashes when run in pipeline
RUN useradd -m -u 1001 AzDevOps_azpcontainer && \
    groupadd azure_pipelines_sudo && \
    usermod -a -G azure_pipelines_sudo AzDevOps_azpcontainer && \
    echo '%azure_pipelines_sudo ALL=(ALL:ALL) NOPASSWD:ALL' >> /etc/sudoers && \
    ln -sf /usr/bin/true /usr/bin/su  && \
    ln -sf /usr/bin/true /usr/sbin/groupadd  && \
    ln -sf /usr/bin/true /usr/sbin/usermod