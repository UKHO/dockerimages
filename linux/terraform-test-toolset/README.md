# terraform-test-toolset

## Purpose
Image based on `terraform-azure-powershell` with all tools needed to lint, document, compliance-test and security-scan Terraform code in CI pipelines.

## Base image

`ukhydrographicoffice/terraform-azure-powershell:latest`

Inherits Terraform, Azure CLI, PowerShell and their dependencies.

## Installed dependencies

| Dependency | Version | Notes |
|---|---|---|
| Go | latest at build time | Resolved dynamically from `https://go.dev/VERSION?m=text` |
| tflint | 0.59.1 | Terraform linter — configurable via `ARG TFLINT_VERSION` |
| terraform-docs | 0.19.0 | README generation / doc check — configurable via `ARG TFDOCS_VERSION` |
| terraform-compliance | 1.14.1 | BDD policy testing (pip) — configurable via `ARG TF_COMPLIANCE_VERSION` |
| snyk | latest at build time | IaC security scanning, pulled from `https://static.snyk.io/cli/latest/snyk-linux` |
| python3-pip | distro package | Python package manager |
| build-essential | distro package | C build toolchain (required by some pip packages) |
| python3-dev | distro package | Python development headers |
| python3-setuptools | distro package | Python packaging utilities |
| python3-wheel | distro package | Python wheel support |
| curl | distro package | Used during image build |
| unzip | distro package | Used during image build |

## Overriding tool versions at build time

```bash
docker build \
  --build-arg TFLINT_VERSION=0.60.0 \
  --build-arg TFDOCS_VERSION=0.20.0 \
  --build-arg TF_COMPLIANCE_VERSION=1.15.0 \
  -t terraform-test-toolset:custom .
```
