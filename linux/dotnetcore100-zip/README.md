# dotnetcore100-zip

## Purpose
.NET 10 SDK build image with `zip` installed for packaging artifacts.

## Installed dependencies
| Dependency | Version | Notes |
|---|---|---|
| .NET SDK | 10.0 | From base image `mcr.microsoft.com/dotnet/sdk:10.0` |
| zip | distro package | Installed via `apt-get` |
