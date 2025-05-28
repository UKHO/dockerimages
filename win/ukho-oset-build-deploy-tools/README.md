# UKHO Build & Deploy Tools Windows Container

This image provides all required PowerShell modules for UKHO Azure DevOps pipeline build and deploy stages, pre-installed from the `ukho.psgallery` ProGet feed.

## Usage

1. **Build the image:**

   ```sh
   docker build -t ukho-build-deploy-tools .
   ```

2. **Run the container:**

   ```sh
   docker run -it ukho-build-deploy-tools
   ```

3. **Add/Update Modules:**
   - Edit the `Dockerfile` to add or update `Install-Module` lines for any additional modules required.

## Notes

- The image uses PowerShell 7 and sets up both PSGallery and your ProGet feed as trusted repositories.
- Update the ProGet URL in the Dockerfile as appropriate for your environment.
- For pipeline use, reference this image in your Azure DevOps pipeline YAML as a container resource.
