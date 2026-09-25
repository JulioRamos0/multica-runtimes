# Multica Runtimes

Welcome to **Multica Runtimes**! This repository provides ready-to-use, isolated Docker environments (runtimes) specifically configured for modern agentic AI CLI tools. 

Each runtime is designed as a secure sandbox equipped with everything the agent needs to operate seamlessly alongside the **Multica CLI**, enabling smooth orchestration and remote control of your AI coding assistants.

## Table of Contents
- [Runtimes](#runtimes)
- [Environment Configuration](#environment-configuration)
- [Multica Setup](#multica-setup)

## Runtimes

Choose your preferred runtime below:

| Short Command | Name |
|--------------|------|
| [`agy`](./agy/README.md) | Antigravity CLI (Gemini) |
| [`claude`](./claude/README.md) | Claude Code |
| [`copilot`](./copilot/README.md) | GitHub Copilot CLI |

> **Note:** Click on the Short Command link to see the specific instructions for each agent runtime.

## Environment Configuration

This repository uses a `.env` file to pass important settings into the runtimes. You can copy the provided example to get started:
```bash
cp .env.example .env
```

The available variables are:
- `GIT_USER_NAME`: Your name for Git commits (e.g., "John Doe").
- `GIT_USER_EMAIL`: Your email for Git commits.

When these are provided, the runtime's entrypoint will automatically configure your Git identity (`git config --global`) and generate an SSH key (`~/.ssh/id_ed25519`) inside the container so the agents can safely commit and push code on your behalf.

## Multica Setup

Once you have followed the instructions in your chosen runtime's `README.md` and your container is running (e.g., `docker compose up -d multica-agy`), you need to connect the runtime to your Multica environment.

1. **Connect to the container:**
   ```bash
   docker exec -it {runtime} bash
   ```
   *(Replace `{runtime}` with your actual container name, e.g., `multica-agy`)*

2. **Run the setup wizard:**
   Inside the container, run the following command to link the agent to your Multica server:

   ### Using multica.ia
   ```
   multica setup
   ```
   *(This will use the default Multica server URL and app URL)*

   ### Using a self-hosted Multica server
   ```bash
   multica setup self-host --server-url {server-url} --app-url {app-url}
   ```
   *(Replace `{server-url}` and `{app-url}` with your actual Multica server URL and app URL, e.g., `https://multica.acme.ia`)*
   This will output an authorization URL. 

3. **Authenticate:**
   Open a **second terminal window** on your host (leave the first one waiting) and run a `curl` to that exact URL:
   ```bash
   docker exec -it {runtime} curl "{url}"
   ```

4. **Verify connection:**
   Return to your first terminal window. The daemon should now be configured. Verify its status:
   ```bash
   multica daemon status
   ```
   If it says `running`, your environment is fully set up and ready to receive remote instructions!

---
