# dependency-check

## Purpose
Container for running OWASP Dependency-Check with a pre-created NVD cache directory and support for injecting an NVD API key via Docker build secret.

## Installed dependencies
| Dependency | Version | Notes |
|---|---|---|
| OWASP Dependency-Check | latest | Provided by base image `owasp/dependency-check:latest` |
| NVD cache directory | N/A | Created at `/usr/share/dependency-check/data/cache` |