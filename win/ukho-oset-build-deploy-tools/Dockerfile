FROM mcr.microsoft.com/windows/servercore:ltsc2022-amd64

SHELL ["powershell", "-Command", "$ErrorActionPreference = 'Stop'; $ProgressPreference = 'SilentlyContinue';"]

# Install NuGet provider explicitly
RUN Install-PackageProvider -Name NuGet -Force; Import-PackageProvider -Name NuGet -Force

# Set PSGallery and ProGet as trusted repositories
RUN Set-PSRepository -Name 'PSGallery' -InstallationPolicy Trusted; \
    if (-not (Get-PSRepository -Name 'ukho.psgallery' -ErrorAction SilentlyContinue)) { \
        Register-PSRepository -Name 'ukho.psgallery' -SourceLocation 'https://progetcloud.ukho.gov.uk/nuget/ukho.psgallery/' -InstallationPolicy Trusted \
    }

# Install UKHO.PSModuleInstaller (replace version as needed)
RUN Install-Module -Name UKHO.PSModuleInstaller -Repository 'ukho.psgallery' -Force

# Copy the install script into the image
COPY install-required-modules.ps1 C:/install-required-modules.ps1

# Run the script to install all required modules
RUN powershell -ExecutionPolicy Bypass -File C:\install-required-modules.ps1

ENTRYPOINT ["powershell"]