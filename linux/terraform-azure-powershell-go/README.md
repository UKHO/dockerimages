# terraform-azure-powershell-go

## Purpose
Image based on `terraform-azure-powershell` with Go added for Terraform providers, tooling, and helper binaries.

## Installed dependencies
| Dependency | Version | Notes |
|---|---|---|
| Base image stack | latest | Inherits from `ukhydrographicoffice/terraform-azure-powershell:latest` |
| Go | latest at build time | Resolved dynamically from `https://go.dev/dl/?mode=json` |
| jq | distro package | Installed via `apt-get` |
| System packages | distro packages | Includes `curl`, `git`, `ca-certificates`, `passwd` |
