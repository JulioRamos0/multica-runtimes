#!/bin/bash
set -e

sudo chown -R multica:multica ~/.multica ~/.ssh 2>/dev/null || true

if [ -f ~/.multica/config.json ]; then
    multica daemon start
fi

if [ -n "$GIT_USER_NAME" ] && [ -n "$GIT_USER_EMAIL" ]; then
    echo "Configuring Git identity..."
    git config --global user.name "$GIT_USER_NAME"
    git config --global user.email "$GIT_USER_EMAIL"
    git config --global pull.rebase false
fi

if [ ! -f ~/.ssh/id_ed25519 ]; then
    echo "Generating SSH key..."
    mkdir -p ~/.ssh
    ssh-keygen -q -t ed25519 -C "${GIT_USER_EMAIL:-runtime@${HOSTNAME}}" -f ~/.ssh/id_ed25519 -N ""
fi

echo "========================================"
echo "SSH Public Key (Add to the remote host SSH keys):"
cat ~/.ssh/id_ed25519.pub
echo "========================================"


exec "$@"
