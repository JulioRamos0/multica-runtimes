ARG REGISTRY=ghcr.io/julioramos0
FROM ${REGISTRY}/multica:latest

RUN curl -fsSL https://antigravity.google/cli/install.sh | bash
RUN echo 'export PATH="/home/multica/.local/bin:$PATH"' >> ~/.bashrc
ENV PATH="/home/multica/.local/bin:${PATH}"

COPY entrypoint.sh /usr/local/bin/entrypoint.sh

RUN chmod +x /usr/local/bin/entrypoint.sh

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
CMD ["/bin/bash"]
