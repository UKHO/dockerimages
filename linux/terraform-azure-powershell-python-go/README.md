# terraform-azure-powershell-python-go

## Purpose
Image based on `terraform-azure-powershell` with Python build tooling and Go for mixed-language IaC pipelines.

## Installed dependencies
| Dependency | Version | Notes |
|---|---|---|
| Base image stack | latest | Inherits from `ukhydrographicoffice/terraform-azure-powershell:latest` |
| Go | latest at build time | Resolved dynamically from `https://go.dev/VERSION?m=text` |
| Python build tooling | distro packages | Includes `python3-pip`, `build-essential`, `python3-dev`, `python3-setuptools`, `python3-wheel` |
| passwd | distro package | Installed via `apt-get` |
