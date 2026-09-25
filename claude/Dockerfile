ARG REGISTRY=ghcr.io/julioramos0
FROM ${REGISTRY}/multica:latest

ENV DEBIAN_FRONTEND=noninteractive

USER root

RUN apt-get update && apt-get install -y curl git gnupg2 ca-certificates && \
    curl -fsSL https://deb.nodesource.com/setup_24.x | bash - && \
    apt-get install -y nodejs && \
    npm install -g @anthropic-ai/claude-code && \
    npm cache clean --force && \
    rm -rf /var/lib/apt/lists/*

COPY entrypoint.sh /usr/local/bin/entrypoint.sh

RUN chmod +x /usr/local/bin/entrypoint.sh

USER multica

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
CMD ["/bin/bash"]
