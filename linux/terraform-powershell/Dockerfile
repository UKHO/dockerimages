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
    ca-certificates=* \
    curl=* \
    apt-transport-https=* \
    lsb-release=* \
    gnupg=* \
    git=* \
    passwd=* \
    wget=* \
    && rm -rf /var/lib/apt/lists/*

# Download and install libicu72 from Debian 12 repository (compatible with PowerShell)
RUN wget http://deb.debian.org/debian/pool/main/i/icu/libicu72_72.1-3+deb12u1_amd64.deb -O /tmp/libicu72.deb \
    && dpkg -i /tmp/libicu72.deb \
    && rm /tmp/libicu72.deb

RUN mkdir -p /etc/apt/keyrings \
    && curl -fsSL https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor --batch --yes -o /etc/apt/keyrings/microsoft.gpg \
    && chmod go+r /etc/apt/keyrings/microsoft.gpg

# Create /etc/shells if it doesn't exist and clean up any stale locks
RUN touch /etc/shells \
    && rm -f /etc/shells.tmp /var/lib/dpkg/lock-frontend /var/lib/dpkg/lock

RUN sh -c 'echo "deb [arch=amd64 signed-by=/etc/apt/keyrings/microsoft.gpg] https://packages.microsoft.com/debian/12/prod bookworm main" > /etc/apt/sources.list.d/microsoft-prod.list' \
    && apt-get update \
    && apt-get install -y --no-install-recommends powershell=* \    
    && rm -rf /var/lib/apt/lists/*