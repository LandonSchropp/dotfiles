#!/usr/bin/env bash

set -euo pipefail

ICLOUD_PREFERENCES="$HOME/Library/Mobile Documents/com~apple~CloudDocs/Preferences"
CONFIG="$HOME/.dotfiles/config/preferences/apps.json"

function print_help() {
  echo "Usage: restore-preferences [options]"
  echo
  echo "Restores macOS app preferences from iCloud Drive. Running apps are quit and reopened."
  echo
  echo "Options:"
  echo
  echo "  --help    Show this help message and exit."
}

while [[ $# -gt 0 ]]; do
  case "$1" in
  --help)
    print_help
    exit 0
    ;;
  *)
    echo "Error: The option $1 is invalid." >&2
    echo >&2
    print_help >&2
    exit 1
    ;;
  esac
done

if ! command -v jq &>/dev/null; then
  echo "Error: jq is required but not installed." >&2
  exit 1
fi

icloud_root="$HOME/Library/Mobile Documents/com~apple~CloudDocs"

while IFS= read -r app; do
  name=$(jq -r '.name' <<<"$app")
  running=false

  echo
  echo -e "\033[0;36m$name\033[0m"
  echo

  # Close the app so the preferences are not restored.
  if pgrep -f "/$name\\.app/" &>/dev/null; then
    running=true
    pkill -f "/$name\\.app/"
  fi

  while IFS= read -r file; do
    destination="${file/#\~/$HOME}"
    source="$ICLOUD_PREFERENCES/$name/$(basename "$destination")"
    display_source="${source//$icloud_root/iCloud Drive}"
    display_destination="${destination//$HOME/~}"

    if [[ ! -f "$source" ]]; then
      echo -e "\033[0;33mSkipping $name: no backup found for $(basename "$destination")\033[0m" >&2
      continue
    fi

    mkdir -p "$(dirname "$destination")"
    defaults import "${destination%.plist}" "$source"
    echo "$display_source → $display_destination"
  done < <(jq -r '.files[]' <<<"$app")

  if [[ "$running" == true ]]; then
    open -a "$name"
  fi
done < <(jq -c '.[]' "$CONFIG")
