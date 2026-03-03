# powershell-azure-node-newman

## Purpose
Automation image that combines Azure tooling, PowerShell, Node.js, and Newman for API and deployment pipelines.

## Installed dependencies
| Dependency | Version | Notes |
|---|---|---|
| Azure CLI | latest at build time | Installed via Microsoft install script |
| AzCopy | latest at build time | Installed from `downloadazcopy-v10-linux` |
| PowerShell | latest at build time | Installed via Microsoft Debian repo |
| Node.js | 22.21.1 | Installed via `nvm` |
| Newman | 6.2.1 | Global npm package |
| libicu72 | 72.1-3+deb12u1 | Installed from Debian package file |
| System packages | distro packages | Includes `curl`, `gzip`, `wget`, `gpg`, `libatomic1`, `passwd` |

