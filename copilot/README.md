# GitHub Copilot Runtime

## Table of Contents
- [Docker Compose](#docker-compose)
- [Usage](#usage)
- [Auth](#auth)
- [Logout](#logout)
- [Test Environment](#test-environment)

## Docker Compose
```yaml
services:
  multica-copilot:
    image: ghcr.io/julioramos0/multica-copilot
    restart: unless-stopped
    container_name: multica-copilot
    hostname: multica-copilot
    stdin_open: true
    tty: true
    volumes:
      - multica_copilot:/home/multica/

volumes:
  multica_copilot:
```

## Usage
1. Start the container in the background:
   ```bash
   docker compose up -d multica-copilot
   ```
2. Connect to the running container interactively:
   ```bash
   docker exec -it multica-copilot bash
   ```

> [!NOTE]
> The very first time you execute `copilot` inside a fresh container, it will prompt you to install the GitHub Copilot CLI payload (`? GitHub Copilot CLI is not installed. Would you like to install it? Yes`). Simply press **Enter** to accept and proceed.

## Auth
This runtime uses the official GitHub CLI (`gh`) with the Copilot extension. To authenticate, run the following command and follow the interactive prompts to log in via browser:
```bash
gh auth login
```

## Logout
To clear your GitHub session and logout, run:
```bash
gh auth logout
```

## Test Environment
To test the environment and verify connectivity by sending a prompt without an interface:
```bash
copilot -p "ping"
```
