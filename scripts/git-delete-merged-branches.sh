#!/usr/bin/env bash

set -euo pipefail

git fetch
git checkout -q master

git branch --no-color --merged \
  | grep -v '\\*' \
  | xargs -n 1 git branch -d
