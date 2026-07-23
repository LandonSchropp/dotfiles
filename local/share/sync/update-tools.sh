#!/usr/bin/env bash

set -euo pipefail

# Function to send notification on error
notify_error() {
  local error_message="$1"
  osascript -e "display notification \"$error_message\" with title \"Daily Update Failed\" sound name \"Basso\""
}

# Trap errors and send notification
trap 'notify_error "Check logs at ~/Library/Logs/com.landonschropp.daily-update/"' ERR

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

log "Starting daily update..."

update "TL/DR" "/opt/homebrew/bin/tldr" "/opt/homebrew/bin/tldr --update"
update "Claude Code" "/opt/homebrew/bin/brew" "/opt/homebrew/bin/brew upgrade --cask claude"
update "Mise" "/opt/homebrew/bin/mise" "/opt/homebrew/bin/mise install"
update "GitHub CLI" "/opt/homebrew/bin/brew" "/opt/homebrew/bin/brew upgrade gh"
update "Oh My Zsh" "$HOME/.oh-my-zsh/tools/upgrade.sh" "$HOME/.oh-my-zsh/tools/upgrade.sh -v silent"

log "Daily update completed successfully"
