#!/usr/bin/env bash

set -euo pipefail

log() {
  echo "[$(date '+%Y-%m-%d %H:%M:%S')] $*"
}

# Runs an update command if the specified command exists on the system
# Args:
#   $1 - Name of the thing being updated (for logging)
#   $2 - Command to check for existence
#   $3 - Update command to run if the command exists
update() {
  local name="$1"
  local command_to_check="$2"
  local update_command="$3"

  log "Updating $name..."

  if command -v "$command_to_check" >/dev/null 2>&1; then
    eval "$update_command"
  else
    log "$command_to_check not found, skipping..."
  fi
}

log "Starting tool updates..."

update "TL/DR" "tldr" "tldr --update"
update "Claude Code" "brew" "brew upgrade --cask claude"
update "Mise" "mise" "mise install"
update "GitHub CLI" "brew" "brew upgrade gh"
update "Oh My Zsh" "$HOME/.oh-my-zsh/tools/upgrade.sh" "$HOME/.oh-my-zsh/tools/upgrade.sh -v silent"

log "Tool updates completed successfully"
