# terraform

## Purpose
Base Terraform image for Linux pipelines with core CLI and common supporting packages.

## Installed dependencies
| Dependency | Version | Notes |
|---|---|---|
| Terraform CLI | latest stable at build time | Resolved by local `versions` script from HashiCorp releases |
| System packages | distro packages | Includes `ca-certificates`, `curl`, `unzip`, `apt-transport-https`, `lsb-release`, `gnupg`, `git`, `passwd` |

