# dotnetcore80-zip

## Purpose
.NET 8 SDK build image with `zip` installed for packaging artifacts.

## Installed dependencies
| Dependency | Version | Notes |
|---|---|---|
| .NET SDK | 8.0 | From base image `mcr.microsoft.com/dotnet/sdk:8.0` |
| zip | distro package | Installed via `apt-get` |
