#!/usr/bin/env bash

set -euo pipefail

# Updates the packages and runtimes that drift over time.

exit_code=0

log() {
  echo "[$(date '+%Y-%m-%d %H:%M:%S')] $*"
}

# Runs an update command, recording a failure rather than aborting, so one broken updater can't
# hold the rest back for a week.
update() {
  log "Running $*..."
  "$@" || exit_code=1
}

log "Starting weekly updates..."

# Homebrew skips the casks that update themselves, so this deliberately isn't greedy.
update brew update
update brew upgrade

update mise upgrade
update mas upgrade

if [[ -x "$HOME/.oh-my-zsh/tools/upgrade.sh" ]]; then
  update "$HOME/.oh-my-zsh/tools/upgrade.sh" -v silent
fi

# Reclaims the disk the upgrades leave behind, so it goes last.
update brew autoremove
update brew cleanup

if ((exit_code != 0)); then
  log "Error: One or more weekly updates failed." >&2
  exit 1
fi

log "Weekly updates completed successfully"
