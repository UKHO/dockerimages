# Docker Images [![Build Status](https://ukhogov.visualstudio.com/Pipelines/_apis/build/status/UKHO.dockerimages?branchName=master)](https://ukhogov.visualstudio.com/Pipelines/_build?definitionId=125)

## About

This is a repository to contain various UKHO Docker Images and will be pushed to our [Dockerhub](https://hub.docker.com/u/ukhydrographicoffice) organization.

Dockerfiles should conform to [best practices](https://docs.docker.com/develop/develop-images/dockerfile_best-practices/)

### Available Images

| Image Name                                                                                      | Platform | Description                  |
|-------------------------------------------------------------------------------------------------|----------|------------------------------|
| [dependency-check](./dependency-check/Dockerfile)                                               | Linux    | Dependency checking tools    |
| [terraform-win](/win/terraform/Dockerfile)                                                      | Windows  | Terraform tools for Windows  |
| [azure](./linux/azure/Dockerfile)                                                               | Linux    | Azure CLI tools              |
| [azure-devops](./linux/azure-devops/Dockerfile)                                                 | Linux    | Azure DevOps tools           |
| [dotnetcore80-zip](./linux/dotnetcore80-zip/Dockerfile)                                         | Linux    | .NET Core 8.0 with zip tools |
| [jdk8-python38](./linux/jdk8-python38/Dockerfile)                                               | Linux    | JDK 8 with Python 3.8        |
| [powershell-azure-node](./linux/powershell-azure-node/Dockerfile)                               | Linux    | PowerShell with Azure CLI and Node.js |
| [powershell-azure-node-newman](./linux/[powershell-azure-node-newman/Dockerfile)                | Linux    | PowerShell with Azure CLI, Node.js and Newman |
| [terraform](./linux/terraform/Dockerfile)                                                       | Linux    | Terraform tools |
| [terraform-azure](./linux/terraform-azure/Dockerfile)                                           | Linux    | Terraform with Azure CLI |
| [terraform-azure-make](./linux/terraform-azure-make/Dockerfile)                                 | Linux    | Terraform with Azure CLI and Make |
| [terraform-azure-powershell](./linux/terraform-azure-powershell/Dockerfile)                     | Linux    | Terraform with Azure CLI and PowerShell |
| [terraform-azure-powershell-go](./linux/terraform-azure-powershell-go/Dockerfile)               | Linux    | Terraform with Azure CLI, PowerShell and Go |
| [terraform-azure-powershell-python-go](./linux/terraform-azure-powershell-python-go/Dockerfile) | Linux    | Terraform with Azure CLI, PowerShell, Python and Go |
| [terraform-azure-powershell-unzip](./linux/terraform-azure-powershell-unzip/Dockerfile)         | Linux    | Terraform with Azure CLI, PowerShell and Unzip |
| [terraform-powershell](./linux/terraform-powershell/Dockerfile)                                 | Linux    | Terraform with PowerShell |

## How to add a Docker Image

1. Create a directory containing a `Dockerfile` and optionally a `README.md`.
2. Add your entry to the [build file](./docker-bake.hcl). This requires adding a target with the required data, and adding to any groups you wish this to be built as apart of within the pipeline. Information about Docker bake can be found [here](https://docs.docker.com/build/bake/reference/#syntax)
3. Update this Readme with your docker image information for ease of reference for others. 

### Lint

Run using `./runner lint`

Lints the Dockerfiles for good practices using [hadolint](https://github.com/hadolint/hadolint)

### Build

If you are using Visual Studio Code, ensure you have the [docker dx](https://marketplace.visualstudio.com/items/?itemName=docker.docker) extension installed. With this you can run builds directly from the bake file.

To run builds from the command line run the following command

```sh
docker buildx bake --call build <target_name> #This can be a group or target name depending on what you want to build  
```

### Publish

__Intended for CI__

Run using `./runner build publish`

Builds and pushes the Docker images:
- `{docker repository from BUILD}/{parent directory}:{latest}`
