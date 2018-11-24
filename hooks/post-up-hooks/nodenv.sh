#!/usr/bin/env bash

# Install a global stable version of Node.js
VERSION=$(nodenv install --list | ag '^\\s+\\d+\\.\\d+\\.\\d+$' | sort -n | tail -n 1)
nodenv install "$VERSION"
nodenv global "$VERSION"
