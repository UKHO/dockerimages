FROM mcr.microsoft.com/windows/servercore:1809 as terraform
SHELL ["powershell", "-Command", "$ErrorActionPreference = 'Stop'; $ProgressPreference = 'SilentlyContinue';"]
WORKDIR /
RUN Invoke-WebRequest https://releases.hashicorp.com/terraform/1.4.5/terraform_1.4.5_windows_amd64.zip -UseBasicParsing -UseDefaultCredentials -PassThru -OutFile ./terraform.zip
RUN Expand-Archive .\terraform.zip

FROM mcr.microsoft.com/windows/servercore:1809
WORKDIR /
COPY --from=terraform /terraform /terraform
ENV PATH=${PATH};C:/terraform/
