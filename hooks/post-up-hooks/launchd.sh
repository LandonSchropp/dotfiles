#!/usr/bin/env bash

set -euo pipefail

for file in ~/Library/LaunchAgents/com.landonschropp.*; do
  launchctl load "$file"
done
