# Agent Guidelines for Multica Runtimes

Welcome to the `multica-runtimes` repository! As an AI agent working on this codebase, you must adhere to the following rules:

## 1. Language Policy
- **English Only**: This is a public repository. All new code comments, documentation (including READMEs), commit messages, and agent interactions should be written in English.

## 2. Runtimes Structure
- This repository contains multiple isolated runtime environments (e.g., `agy`, `claude`, `copilot`) for different AI agents.
- Each runtime is self-contained in its respective directory.
- **Documentation**: Each runtime directory must contain its own `README.md` which must *strictly* include only the following sections in this exact order:
  1. **Table of Contents**: An index linking to the sections of the document.
  2. **Docker Compose**: A snippet demonstrating how to use the prebuilt image in a standalone `docker-compose.yml`.
  3. **Usage**: Instructions on how to start the container (`docker compose up`) and connect to it (`docker exec -it {runtime} bash`).
  4. **Auth**: Happy path instructions using the CLI tool to authenticate.
  5. **Logout**: Instructions on how to exit or clear the current session.
  6. **Test Environment**: Instructions on how to send a prompt without an interface (e.g., `{runtime} -p "ping"`).

## 3. Modifying Runtimes
- When creating or updating a runtime, ensure its `Dockerfile` and `setup.sh` are robust, minimal, and well-documented.
- Keep runtime-specific dependencies contained within their own directories.
- Always keep the root `docker-compose.yml` updated if a new runtime is introduced.

## 4. Root Documentation Strategy
- The root `README.md` should serve as a high-level overview of the repository. It must *strictly* include the following sections:
  1. **Table of Contents**: An index linking to the sections of the document.
  2. **Runtimes**: A table listing available runtimes (e.g., Short Command, Name). The Short Command must be a clickable link directing the user to that runtime's specific `README.md`.
  3. **Multica Setup**: Instructions on how to connect to a configured runtime using `docker exec -it {runtime} bash`, perform the Multica authentication process, and run commands (like `multica daemon status`) to verify it's running correctly.
