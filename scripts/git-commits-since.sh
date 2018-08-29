#!/usr/bin/env bash

set -euo pipefail

# Prints all of the commits since the given time period, or 4AM is no time period is specified.
if [ "$#" -gt 1 ]; then
  >&2 echo "Usage: all-git-commits-since.sh [SINCE]"
  exit 1
fi

REPO=$(basename "$(git rev-parse --show-toplevel)")

git \
  --no-pager \
  log \
  --since="$1" \
  --author="Landon" \
  --date=format:'%Y-%m-%d %H:%M:%S' \
  --format="[%Cblue%ad%Creset] %Cgreen$REPO%Creset %s (%Cred%h%Creset)"
