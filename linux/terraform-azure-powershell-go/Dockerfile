FROM ukhydrographicoffice/terraform-azure-powershell:latest

# Install dependencies
RUN apt-get update && apt-get install -y --reinstall passwd && apt-get install -y curl git ca-certificates jq

# Get latest version dynamically and install Go
RUN GO_URL="https://go.dev/dl/?mode=json" && \
    GO_VERSION=$(curl -s $GO_URL | jq -r '.[0].version' | sed 's/go//') && \
    curl -LO https://go.dev/dl/go${GO_VERSION}.linux-amd64.tar.gz && \
    tar -C /usr/local -xzf go${GO_VERSION}.linux-amd64.tar.gz && \
    rm go${GO_VERSION}.linux-amd64.tar.gz

# Set Go in PATH
ENV PATH="/usr/local/go/bin:${PATH}"

# Create AzDevOps_azpcontainer user and add to sudoers as crashes when run in pipeline
RUN useradd -m -u 1001 AzDevOps_azpcontainer && \
    groupadd azure_pipelines_sudo && \
    usermod -a -G azure_pipelines_sudo AzDevOps_azpcontainer && \
    echo '%azure_pipelines_sudo ALL=(ALL:ALL) NOPASSWD:ALL' >> /etc/sudoers && \
    ln -sf /usr/bin/true /usr/bin/su  && \
    ln -sf /usr/bin/true /usr/sbin/groupadd  && \
    ln -sf /usr/bin/true /usr/sbin/usermod