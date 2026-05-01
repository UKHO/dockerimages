FROM ukhydrographicoffice/terraform-azure-powershell:latest

ARG TFLINT_VERSION=0.59.1
ARG TFDOCS_VERSION=0.19.0
ARG TF_COMPLIANCE_VERSION=1.14.1

# Ensure we are root for installs (base image may drop to a non-root user)
USER root

RUN apt-get update -q -y && apt-get install -q -y --no-install-recommends \
        curl \
        unzip \
        python3-pip \
        build-essential \
        python3-dev \
        python3-setuptools \
        python3-wheel \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# ── Go ───────────────────────────────────────────────────────────────────────
RUN GO_VERSION="$(curl 'https://go.dev/VERSION?m=text' | head -n 1)" && \
    curl -O "https://dl.google.com/go/${GO_VERSION}.linux-amd64.tar.gz" && \
    tar -C /usr/local -xzf "${GO_VERSION}.linux-amd64.tar.gz" && \
    rm "${GO_VERSION}.linux-amd64.tar.gz"
ENV PATH="${PATH}:/usr/local/go/bin"

RUN \
    # ── tflint ──────────────────────────────────────────────────────────────
    curl -fsSL \
        "https://github.com/terraform-linters/tflint/releases/download/v${TFLINT_VERSION}/tflint_linux_amd64.zip" \
        -o /tmp/tflint.zip \
    && unzip -q /tmp/tflint.zip -d /tmp/tflint-bin \
    && install -m 0755 /tmp/tflint-bin/tflint /usr/local/bin/tflint \
    && rm -rf /tmp/tflint.zip /tmp/tflint-bin \
    \
    # ── terraform-docs ──────────────────────────────────────────────────────
    && curl -fsSLo /tmp/terraform-docs.tar.gz \
        "https://github.com/terraform-docs/terraform-docs/releases/download/v${TFDOCS_VERSION}/terraform-docs-v${TFDOCS_VERSION}-linux-amd64.tar.gz" \
    && tar -xzf /tmp/terraform-docs.tar.gz -C /tmp terraform-docs \
    && install -m 0755 /tmp/terraform-docs /usr/local/bin/terraform-docs \
    && rm -f /tmp/terraform-docs.tar.gz /tmp/terraform-docs \
    \
    # ── terraform-compliance (pip) ───────────────────────────────────────────
    && pip3 install --no-cache-dir --break-system-packages \
        "terraform-compliance==${TF_COMPLIANCE_VERSION}" \
    # Patch: add TF 1.15 support (https://github.com/terraform-compliance/cli/pull/795)
    && python3 -c "import terraform_compliance.extensions.terraform as m, inspect; f=inspect.getfile(m); c=open(f).read(); open(f,'w').write(c.replace('\x271.14.\x27,','\x271.14.\x27,\x0a            \x271.15.\x27,'))" \
    \
    # ── snyk CLI ────────────────────────────────────────────────────────────
    && curl -fsSLo /usr/local/bin/snyk \
        "https://static.snyk.io/cli/latest/snyk-linux" \
    && chmod +x /usr/local/bin/snyk

# Smoke-check all installed tools
RUN tflint --version \
    && terraform-docs --version \
    && terraform-compliance --version \
    && snyk --version \
    && go version