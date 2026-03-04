# azure-devops

## Purpose
Azure CLI image extended with Azure DevOps CLI support for pipeline/repo/project automation.

## Installed dependencies
| Dependency | Version | Notes |
|---|---|---|
| Azure CLI | latest at build time | Installed via Microsoft install script |
| Azure DevOps CLI extension | latest at build time | Installed with `az extension add --name azure-devops` |
| curl | distro package | Installed via `apt-get` |
| passwd | distro package | Installed via `apt-get` |

