FROM dhi.io/debian-base:trixie-dev AS terraform
SHELL ["/bin/bash", "-o", "pipefail", "-c"]
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
    ca-certificates=* \
    curl=* \
    unzip=* \
    && rm -rf /var/lib/apt/lists/*
WORKDIR /
COPY versions versions
RUN chmod a+x ./versions && \
    version=$(./versions) && \
    curl -O "https://releases.hashicorp.com/terraform/${version}/terraform_${version}_linux_amd64.zip" -sk && \
    unzip -j "terraform_${version}_linux_amd64.zip"

FROM dhi.io/debian-base:trixie-dev
COPY --from=terraform /terraform /usr/local/bin/terraform
SHELL ["/bin/bash", "-o", "pipefail", "-c"]
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
    curl=* \
    wget=* \
    gpg=* \
    git=*

# Download and install libicu72 from Debian 12 repository (compatible with PowerShell)
RUN wget http://deb.debian.org/debian/pool/main/i/icu/libicu72_72.1-3+deb12u1_amd64.deb -O /tmp/libicu72.deb \
    && dpkg -i /tmp/libicu72.deb \
    && rm /tmp/libicu72.deb

# Create /etc/shells if it doesn't exist and clean up any stale locks
RUN touch /etc/shells \
    && rm -f /etc/shells.tmp /var/lib/dpkg/lock-frontend /var/lib/dpkg/lock

RUN curl -sL https://aka.ms/InstallAzureCLIDeb | bash
RUN curl -sL https://aka.ms/downloadazcopy-v10-linux | tar -xz -C /usr/local/bin --strip-components=1 \
    && chmod +x /usr/local/bin/azcopy

RUN mkdir -p /etc/apt/keyrings \
    && curl -fsSL https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor --batch --yes -o /etc/apt/keyrings/microsoft.gpg \
    && chmod go+r /etc/apt/keyrings/microsoft.gpg \
    && sh -c 'echo "deb [arch=amd64 signed-by=/etc/apt/keyrings/microsoft.gpg] https://packages.microsoft.com/debian/12/prod bookworm main" > /etc/apt/sources.list.d/microsoft-prod.list' \
    && apt-get update \
    && apt-get install -y --no-install-recommends powershell=* \    
    && rm -rf /var/lib/apt/lists/*

# Create AzDevOps_azpcontainer user and add to sudoers as crashes when run in pipeline
RUN useradd -m -u 1001 AzDevOps_azpcontainer && \
    groupadd azure_pipelines_sudo && \
    usermod -a -G azure_pipelines_sudo AzDevOps_azpcontainer && \
    echo '%azure_pipelines_sudo ALL=(ALL:ALL) NOPASSWD:ALL' >> /etc/sudoers && \
    ln -sf /usr/bin/true /usr/bin/su  && \
    ln -sf /usr/bin/true /usr/sbin/groupadd  && \
    ln -sf /usr/bin/true /usr/sbin/usermod

