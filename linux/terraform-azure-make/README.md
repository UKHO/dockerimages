# terraform-azure-make

## Purpose
Terraform + Azure tooling image with `make` included for build orchestration in CI.

## Installed dependencies
| Dependency | Version | Notes |
|---|---|---|
| Terraform CLI | latest stable at build time | Resolved by local `versions` script from HashiCorp releases |
| Azure CLI | latest at build time | Installed via Microsoft install script |
| AzCopy | latest at build time | Installed from `downloadazcopy-v10-linux` |
| make | distro package | Installed via `apt-get` |
| System packages | distro packages | Includes `curl`, `git`, `passwd` |

