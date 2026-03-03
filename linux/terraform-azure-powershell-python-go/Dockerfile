FROM ukhydrographicoffice/terraform-azure-powershell:latest

RUN apt-get update -q -y && apt-get install -q -y --reinstall passwd && apt-get install -q -y --no-install-recommends \
                                                    python3-pip=* \
                                                    build-essential=* \
                                                    python3-dev=* \ 
                                                    python3-setuptools=* \
                                                    python3-wheel=* \ 
                                                && apt-get clean \
                                                && rm -r /var/lib/apt/lists/*

RUN GO_VERSION="$(curl 'https://go.dev/VERSION?m=text' | head -n 1)" && \
    curl -O "https://dl.google.com/go/${GO_VERSION}.linux-amd64.tar.gz" && \
    tar -C /usr/local -xzf "${GO_VERSION}.linux-amd64.tar.gz"
ENV PATH="${PATH}:/usr/local/go/bin"

# Create AzDevOps_azpcontainer user and add to sudoers as crashes when run in pipeline
RUN useradd -m -u 1001 AzDevOps_azpcontainer && \
    groupadd azure_pipelines_sudo && \
    usermod -a -G azure_pipelines_sudo AzDevOps_azpcontainer && \
    echo '%azure_pipelines_sudo ALL=(ALL:ALL) NOPASSWD:ALL' >> /etc/sudoers && \
    ln -sf /usr/bin/true /usr/bin/su  && \
    ln -sf /usr/bin/true /usr/sbin/groupadd  && \
    ln -sf /usr/bin/true /usr/sbin/usermod