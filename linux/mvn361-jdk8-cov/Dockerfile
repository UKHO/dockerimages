FROM maven:3.6.1-jdk-8
SHELL ["/bin/bash", "-o", "pipefail", "-c"]
RUN curl -sL https://deb.nodesource.com/setup_10.x | bash - \
    && curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
    && echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list \
    && apt-get update && apt-get install -y --no-install-recommends \
    git=* \
    && rm -rf /var/lib/apt/lists/*
ADD ./cov-analysis-linux64-2019.12.tar.gz /usr/local/bin
ENV COVERITY_TOOL_HOME=/usr/local/bin/cov-analysis-linux64-2019.12
ENV PATH=${PATH}:${COVERITY_TOOL_HOME}/bin
RUN rm -rf /tmp/*
