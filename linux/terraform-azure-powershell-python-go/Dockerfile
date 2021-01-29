FROM ukhydrographicoffice/terraform-azure-powershell:latest

RUN apt-get update -q -y && apt-get install -q -y python3-pip=18.1-5 \
                                                    python3-setuptools=40.8.0-1 \
                                                    python3-dev=3.7.3-1 \ 
                                                    python3-wheel=0.32.3-2

RUN export GO_VERSION=$(curl 'https://golang.org/VERSION?m=text') && \
    curl -O "https://dl.google.com/go/${GO_VERSION}.linux-amd64.tar.gz" && \
    tar -C /usr/local -xzf ${GO_VERSION}.linux-amd64.tar.gz
ENV PATH=${PATH}:/usr/local/go/bin
