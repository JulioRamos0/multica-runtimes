# Claude Code Runtime

## Table of Contents
- [Docker Compose](#docker-compose)
- [Usage](#usage)
- [Auth](#auth)
- [Logout](#logout)
- [Test Environment](#test-environment)

## Docker Compose
```yaml
services:
  multica-claude:
    image: ghcr.io/julioramos0/multica-claude
    restart: unless-stopped
    container_name: multica-claude
    hostname: multica-claude
    stdin_open: true
    tty: true
    volumes:
      - multica_claude:/home/multica/

volumes:
  multica_claude:
```

## Usage
1. Start the container in the background:
   ```bash
   docker compose up -d multica-claude
   ```
2. Connect to the running container interactively:
   ```bash
   docker exec -it multica-claude bash
   ```

## Auth
Claude Code relies primarily on the `ANTHROPIC_API_KEY` provided via environment variables. If your API key is correctly configured in your `.env` file, the agent will authenticate seamlessly on the first run.

If you are using it without an API key and prefer the OAuth flow, run the following command inside the container:
```bash
claude auth login
```

## Logout
If you need to switch accounts or clear your OAuth session, run:
```bash
claude auth logout
```

## Test Environment
To test the environment and verify connectivity by sending a prompt without an interface:
```bash
claude -p "ping"
```
