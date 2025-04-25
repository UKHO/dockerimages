FROM ukhydrographicoffice/terraform-azure-powershell:latest

RUN apt-get update -q -y && apt-get install -q -y --no-install-recommends \
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
