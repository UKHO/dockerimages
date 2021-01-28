FROM ukhydrographicoffice/terraform-azure-powershell:latest

RUN apt-get update -q -y && apt-get install -q -y python3-pip python3-setuptools

RUN export GO_VERSION=$(curl 'https://golang.org/VERSION?m=text') && \
    curl -O "https://dl.google.com/go/${GO_VERSION}.linux-amd64.tar.gz" && \
    tar -C /usr/local -xzf ${GO_VERSION}.linux-amd64.tar.gz
ENV PATH=${PATH}:/usr/local/go/bin
