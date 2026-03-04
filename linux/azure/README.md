# azure

## Purpose
Lightweight Azure CLI image for running `az` commands in CI/CD and automation.

## Installed dependencies
| Dependency | Version | Notes |
|---|---|---|
| Azure CLI | latest at build time | Installed via Microsoft install script |
| curl | distro package | Installed via `apt-get` |
| passwd | distro package | Installed via `apt-get` |

