# terraform-powershell

## Purpose
Terraform image with PowerShell added for script-driven infrastructure tasks.

## Installed dependencies
| Dependency | Version | Notes |
|---|---|---|
| Terraform CLI | latest stable at build time | Resolved by local `versions` script from HashiCorp releases |
| PowerShell | latest at build time | Installed via Microsoft Debian repo |
| libicu72 | 72.1-3+deb12u1 | Installed from Debian package file |
| System packages | distro packages | Includes `ca-certificates`, `curl`, `apt-transport-https`, `lsb-release`, `gnupg`, `git`, `passwd`, `wget` |

