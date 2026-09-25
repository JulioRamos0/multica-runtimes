# Contributing to Multica Runtimes

First off, thank you for considering contributing to Multica Runtimes! We welcome community contributions, especially new runtime environments for different AI agents.

## Submitting a New Runtime

If you want to add support for a new AI CLI tool or agent, please follow these guidelines to ensure consistency across the repository:

1. **Create a Dedicated Directory:**
   Create a new folder in the root of the repository named after the runtime (e.g., `my-new-agent`).

2. **Create the Dockerfile:**
   Your runtime should be based on our core image (`ghcr.io/julioramos0/multica:latest`). Keep the Dockerfile minimal, robust, and contained within your directory. Avoid installing unnecessary system packages.

3. **Write the Documentation:**
   Inside your runtime directory, you must include a `README.md` file. It **must strictly** follow the structure defined in [`AGENTS.md`](./AGENTS.md). Please use the existing runtimes (like `agy` or `claude`) as a reference.

4. **Update Root Configurations:**
   - Add your new runtime to the global `docker-compose.yml`.
   - Update the "Runtimes" table in the root [`README.md`](./README.md) to include the new short command and a link to your runtime's documentation.

## Development Process

1. **Fork the repo** and create your branch from `main`.
2. **Make your changes** in a descriptive branch (e.g., `feat/add-new-agent-runtime`).
3. **Test your build locally:**
   Run `docker compose build` to ensure your new or modified runtime compiles successfully without errors.
4. **Test the runtime:**
   Run `docker compose up -d {your-runtime}` and `docker exec -it {your-runtime} bash` to verify that the environment and the authentication steps work as expected.
5. **Submit a Pull Request:**
   Open a PR and fill out the provided template so we can review your contribution efficiently.
