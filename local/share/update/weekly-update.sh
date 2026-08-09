#!/usr/bin/env bash

set -euo pipefail

# Updates the packages and runtimes that drift over time.

exit_code=0

log() {
  echo "[$(date '+%Y-%m-%d %H:%M:%S')] $*"
}

# These install a .pkg, which prompts for an administrator password the scheduled run has no
# terminal to answer. Upgrade them by hand, and add any new one here.
MANUAL_CASKS='cold-turkey-blocker|docker-desktop|virtualbox'

# Upgrades the outdated casks, minus the ones above. Homebrew already leaves out the casks that
# update themselves, so what it reports is non-greedy.
upgrade_casks() {
  local outdated casks

  outdated=$(brew outdated --cask --quiet) || return 1
  casks=$(printf '%s' "$outdated" | grep -Evx "$MANUAL_CASKS") || return 0

  # shellcheck disable=SC2086 # Cask names have no spaces, and each needs to be its own argument.
  brew upgrade --cask $casks
}

# Runs an update command, recording a failure rather than aborting, so one broken updater can't
# hold the rest back for a week.
update() {
  log "Running $*..."
  "$@" || exit_code=1
}

log "Starting weekly updates..."

update brew update
update brew upgrade --formula
update upgrade_casks

update mise upgrade

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
