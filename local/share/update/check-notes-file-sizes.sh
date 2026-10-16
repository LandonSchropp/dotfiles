#!/usr/bin/env bash

set -euo pipefail

# Opens a herdr-project fix session when a Notes vault file is over Obsidian Sync Standard's 5 MB
# limit.

vault="$HOME/Notes"

[[ -d "$vault" ]] || exit 0

# Sync ignores hidden files and folders, except for the .obsidian config folder.
files=$(find "$vault" -name '.*' ! -path "$vault/.obsidian" -prune -o -type f -size +5242880c -print)

[[ -z "$files" ]] && exit 0

echo "Error: These Notes files are over Obsidian Sync's 5 MB limit:" >&2
echo "$files" >&2

herdr-project open --project notes --name fix-file-sizes --no-focus --prompt \
  "These files in the Notes vault are over Obsidian Sync Standard's 5 MB per-file limit, so Sync skips them without warning:

$files

For each one, propose shrinking it to 5,242,880 bytes or less or removing it from the vault, and wait for my go before changing anything. Once none are over the limit, close this workspace."

exit 1
