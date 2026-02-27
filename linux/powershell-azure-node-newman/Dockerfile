FROM dhi.io/debian-base:trixie-dev
SHELL ["/bin/bash", "-o", "pipefail", "-c"]
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
    curl=* \
    gzip=* \
    wget=* \
    gpg=* \
    libatomic1=* \
    passwd=* \
    && rm -rf /var/lib/apt/lists/*

# Download and install libicu72 from Debian 12 repository (compatible with PowerShell)
RUN wget http://deb.debian.org/debian/pool/main/i/icu/libicu72_72.1-3+deb12u1_amd64.deb -O /tmp/libicu72.deb \
    && dpkg -i /tmp/libicu72.deb \
    && rm /tmp/libicu72.deb

RUN curl -sL https://aka.ms/InstallAzureCLIDeb | bash

# Install AzCopy and PowerShell through the official Microsoft package repository.
RUN mkdir -p /etc/apt/keyrings \
    && curl -fsSL https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor --batch --yes -o /etc/apt/keyrings/microsoft.gpg \
    && chmod go+r /etc/apt/keyrings/microsoft.gpg \
    && echo "deb [arch=amd64 signed-by=/etc/apt/keyrings/microsoft.gpg] https://packages.microsoft.com/debian/12/prod bookworm main" > /etc/apt/sources.list.d/microsoft-prod.list

# Create /etc/shells if it doesn't exist and clean up any stale locks
RUN touch /etc/shells \
    && rm -f /etc/shells.tmp /var/lib/dpkg/lock-frontend /var/lib/dpkg/lock

RUN apt-get update \
    && apt-get install -y --no-install-recommends azcopy powershell

ENV NODE_VERSION=22.21.1
RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash
ENV NVM_DIR=/root/.nvm
RUN . "$NVM_DIR/nvm.sh" && nvm install ${NODE_VERSION}
RUN . "$NVM_DIR/nvm.sh" && nvm use ${NODE_VERSION}
RUN . "$NVM_DIR/nvm.sh" && nvm alias default ${NODE_VERSION}
RUN . "$NVM_DIR/nvm.sh" && npm install -g newman@6.2.1

# Add Node.js binary path to the system PATH
ENV PATH="/root/.nvm/versions/node/v${NODE_VERSION}/bin/:${PATH}"