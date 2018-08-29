#!/usr/bin/env bash

set -euo pipefail

# Prints all of the commits (from all development repositories) since the given time period, or 4AM
# is no time period is specified.
if [ "$#" -gt 1 ]; then
  >&2 echo "Usage: all-git-commits-since.sh <SINCE>"
  exit 1
fi

find . -name .git -type d -execdir grealpath "{}" -exec bash -c "scripts/git-commits-since.sh $1" \;
find . -name .git -type d -exec echo {} \;
