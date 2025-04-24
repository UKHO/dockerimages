FROM ukhydrographicoffice/terraform-azure-powershell:latest

# Install dependencies
RUN apt-get update && apt-get install -y curl git ca-certificates jq

# Get latest version dynamically and install Go
RUN GO_URL="https://go.dev/dl/?mode=json" && \
    GO_VERSION=$(curl -s $GO_URL | jq -r '.[0].version' | sed 's/go//') && \
    curl -LO https://go.dev/dl/go${GO_VERSION}.linux-amd64.tar.gz && \
    tar -C /usr/local -xzf go${GO_VERSION}.linux-amd64.tar.gz && \
    rm go${GO_VERSION}.linux-amd64.tar.gz

# Set Go in PATH
ENV PATH="/usr/local/go/bin:${PATH}"
