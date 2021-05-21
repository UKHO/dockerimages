FROM mcr.microsoft.com/powershell as terraform
SHELL ["powershell", "-Command", "$ErrorActionPreference = 'Stop'; $ProgressPreference = 'SilentlyContinue';"]
WORKDIR /
RUN Invoke-WebRequest https://releases.hashicorp.com/terraform/0.14.4/terraform_0.14.4_windows_amd64.zip -UseBasicParsing -UseDefaultCredentials -PassThru -OutFile ./terraform.zip
RUN Expand-Archive .\terraform.zip

FROM mcr.microsoft.com/windows/servercore:2004
COPY --from=terraform /terraform /terraform
ENV PATH=${PATH};C:/terraform/
