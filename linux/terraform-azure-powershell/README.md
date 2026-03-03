# terraform-azure-powershell

## Purpose
Terraform and Azure automation image that also includes PowerShell for cross-platform scripting.

## Installed dependencies
| Dependency | Version | Notes |
|---|---|---|
| Terraform CLI | latest stable at build time | Resolved by local `versions` script from HashiCorp releases |
| Azure CLI | latest at build time | Installed via Microsoft install script |
| AzCopy | latest at build time | Installed from `downloadazcopy-v10-linux` |
| PowerShell | latest at build time | Installed via Microsoft Debian repo |
| libicu72 | 72.1-3+deb12u1 | Installed from Debian package file |
| System packages | distro packages | Includes `curl`, `wget`, `gpg`, `git`, `passwd` |

