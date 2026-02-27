# terraform-azure-powershell-unzip

## Purpose
Terraform + Azure + PowerShell image variant that also includes `unzip` for artifact handling workflows.

## Installed dependencies
| Dependency | Version | Notes |
|---|---|---|
| Terraform CLI | latest stable at build time | Resolved by local `versions` script from HashiCorp releases |
| Azure CLI | latest at build time | Installed via Microsoft install script |
| AzCopy | latest at build time | Installed from `downloadazcopy-v10-linux` |
| PowerShell | latest at build time | Installed via Microsoft Debian repo |
| libicu72 | 72.1-3+deb12u1 | Installed from Debian package file |
| unzip | distro package | Installed via `apt-get` |
| System packages | distro packages | Includes `curl`, `wget`, `gpg`, `git`, `passwd` |

