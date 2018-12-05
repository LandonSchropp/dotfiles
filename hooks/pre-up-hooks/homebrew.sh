#!/usr/bin/env bash

set -euo pipefail

# Install Homebrew if it has not already been installed
if ! command -v brew 1>/dev/null; then
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Install all of the Homebrew applications
# BUG FIX: This command needs to be forced to exit 0 because some apps may already be installed.
brew bundle --file="$HOME/.dotfiles/Brewfile" || :
