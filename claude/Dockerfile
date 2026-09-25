ARG REGISTRY=ghcr.io/julioramos0
FROM ${REGISTRY}/multica:latest

ENV DEBIAN_FRONTEND=noninteractive

USER root

RUN apt-get update && apt-get install -y curl git gnupg2 ca-certificates && rm -rf /var/lib/apt/lists/*

RUN curl -fsSL https://deb.nodesource.com/setup_20.x | bash - \
    && apt-get install -y nodejs \
    && rm -rf /var/lib/apt/lists/*

RUN npm install -g @anthropic-ai/claude-code

COPY entrypoint.sh /usr/local/bin/entrypoint.sh

RUN chmod +x /usr/local/bin/entrypoint.sh

USER multica

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
CMD ["/bin/bash"]
