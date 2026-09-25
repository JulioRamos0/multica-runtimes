# Antigravity (agy) Runtime

## Table of Contents
- [Docker Compose](#docker-compose)
- [Usage](#usage)
- [Auth](#auth)
- [Logout](#logout)
- [Test Environment](#test-environment)

## Docker Compose
```yaml
services:
  multica-agy:
    image: ghcr.io/julioramos0/multica-agy
    restart: unless-stopped
    container_name: multica-agy
    hostname: multica-agy
    stdin_open: true
    tty: true
    volumes:
      - multica_agy:/home/multica/

volumes:
  multica_agy:
```

## Usage
1. Start the container in the background:
   ```bash
   docker compose up -d multica-agy
   ```
2. Connect to the running container interactively:
   ```bash
   docker exec -it multica-agy bash
   ```

## Auth
The Antigravity CLI uses a "lazy authentication" approach. Once inside the container, just start the agent with a ping prompt:
```bash
agy -p "ping"
```
If you are not authenticated or your session has expired, the CLI will automatically interrupt and prompt you to log in.

## Logout
If you logged in with the wrong account and need to reset your credentials:
1. Enter the interactive chat by running `agy`.
2. Type the slash command `/logout` inside the chat prompt and press enter.
3. Your session will be cleared.

## Test Environment
To test the environment and verify connectivity by sending a prompt without an interface:
```bash
agy -p "ping"
```
