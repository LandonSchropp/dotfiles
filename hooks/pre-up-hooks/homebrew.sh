#!/usr/bin/env bash

set -euo pipefail

# Install Homebrew if it has not already been installed
if ! command -v brew 1>/dev/null; then
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Install all of the Homebrew applications
brew bundle --file="$HOME/.dotfiles/Brewfile" --force
