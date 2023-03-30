FROM mcr.microsoft.com/windows/servercore:1809 as terraform
SHELL ["powershell", "-Command", "$ErrorActionPreference = 'Stop'; $ProgressPreference = 'SilentlyContinue';"]
WORKDIR /
RUN Invoke-WebRequest https://releases.hashicorp.com/terraform/0.14.4/terraform_0.14.4_windows_amd64.zip -UseBasicParsing -UseDefaultCredentials -PassThru -OutFile ./terraform.zip
RUN Expand-Archive .\terraform.zip

FROM mcr.microsoft.com/windows/servercore:1809 as azurecli
SHELL ["powershell", "-Command", "$ErrorActionPreference = 'Stop'; $ProgressPreference = 'SilentlyContinue';"]
WORKDIR /
COPY --from=terraform /terraform /terraform
ENV PATH=${PATH};C:/terraform/
RUN Invoke-WebRequest -Uri https://aka.ms/installazurecliwindows -OutFile ./AzureCLI.msi 
RUN Start-Process msiexec.exe -Wait -ArgumentList '/I AzureCLI.msi /quiet'; rm ./AzureCLI.msi
