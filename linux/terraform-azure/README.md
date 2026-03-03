# terraform-azure

## Purpose
Terraform image extended with Azure CLI and AzCopy for Azure infrastructure workflows.

## Installed dependencies
| Dependency | Version | Notes |
|---|---|---|
| Terraform CLI | latest stable at build time | Resolved by local `versions` script from HashiCorp releases |
| Azure CLI | latest at build time | Installed via Microsoft install script |
| AzCopy | latest at build time | Installed from `downloadazcopy-v10-linux` |
| System packages | distro packages | Includes `curl`, `git`, `passwd` |

