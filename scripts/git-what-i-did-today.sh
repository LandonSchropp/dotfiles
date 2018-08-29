#!/usr/bin/env bash

set -euo pipefail

# Find all of the git directories and print their commits.
find ~/Development -name .git -type d -prune -print0 \
  | xargs -0 scripts/git-commits-since.sh "yesterday"
  # | xargs -0 -I {} git --no-pager --git-dir {} log --oneline --since="yesterday 4am" --author="Landon"
