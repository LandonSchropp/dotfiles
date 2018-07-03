#!/usr/bin/env bash

set -euo pipefail

# Install or update NVM.
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh | bash

# Install a global stable version of Node.js
nvm install stable
nvm use stable
