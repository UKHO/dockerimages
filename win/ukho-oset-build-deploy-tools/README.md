# UKHO Build & Deploy Tools Windows Container

This image provides all required PowerShell modules for UKHO Azure DevOps pipeline build and deploy stages, pre-installed from the `ukho.psgallery` ProGet feed using the `UKHO.PSModuleInstaller` module.

## Usage

1. **Build the image:**

   ```sh
   docker build -t ukho-build-deploy-tools .
   ```

2. **Run the container interactively:**

   ```sh
   docker run -it ukho-build-deploy-tools powershell
   ```

3. **Verify installed modules inside the container:**

   ```powershell
   Get-Module -ListAvailable
   Import-Module UKHO.PSModuleInstaller
   ```

## How it works

- The Dockerfile installs the NuGet provider, registers PSGallery and the UKHO ProGet feed, and installs the `UKHO.PSModuleInstaller` module.
- The `install-required-modules.ps1` script defines all required modules and uses `Install-PSModules` to install them during the image build.
- All modules are available for use in Azure DevOps pipeline build and deploy stages.

## Notes

- The image uses Windows Server Core 2019 as the base.
- Update the module list in `install-required-modules.ps1` to add or change required modules.
- For Azure DevOps, reference this image as a container resource in your pipeline YAML.
