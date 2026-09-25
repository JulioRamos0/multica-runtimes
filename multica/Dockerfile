FROM debian:trixie-slim

ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get install -y curl git sudo && rm -rf /var/lib/apt/lists/*
RUN curl -fsSL https://raw.githubusercontent.com/multica-ai/multica/main/scripts/install.sh | bash

RUN useradd -m -s /bin/bash multica && \
    echo "multica ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers && \
    echo 'if [ ! -s ~/.ssh/known_hosts ]; then echo -e "\n\033[1;33m⚠️  Warning: SSH known_hosts is empty.\033[0m\nTo prevent Git operations from hanging, please authenticate your Git server by running:\n  \033[1;36mssh -T git@<your-git-server>\033[0m\n"; fi' >> /home/multica/.bashrc && \
    echo 'if ! multica daemon status 2>/dev/null | grep -qi "running"; then echo -e "\n\033[1;31m⚠️  Warning: Multica daemon is not running.\033[0m\nPlease configure it by running one:\n  \033[1;36mmultica setup\033[0m\n  \033[1;36mmultica setup self-host --server-url <url> --app-url <url>\033[0m\n"; fi' >> /home/multica/.bashrc

USER multica
WORKDIR /home/multica