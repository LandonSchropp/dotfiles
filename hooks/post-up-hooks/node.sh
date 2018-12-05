#!/usr/bin/env bash

set -euo pipefail

# Install NVM if it's not already installed
if [ ! -f "$HOME/.nvm/nvm.sh" ]; then
  curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh | bash
fi

# Set Yarn default configuration
yarn config set init-author-url "https://landonschropp.com"
yarn config set init-author-email "schroppl@gmail.com"
yarn config set init-author-name "Landon Schropp"
yarn config set init-license UNLICENSED
