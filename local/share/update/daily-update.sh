#!/usr/bin/env bash

set -euo pipefail

# Runs the quick, low-risk updates that keep the machine current day to day.

exit_code=0

log() {
  echo "[$(date '+%Y-%m-%d %H:%M:%S')] $*"
}

# Runs an update command, recording a failure rather than aborting, so one broken step can't hold
# the rest back for the day.
update() {
  log "Running $*..."
  "$@" || exit_code=1
}

log "Starting daily updates..."

update sync-repositories
update sync-dictionaries
update tldr --update

# Installs the versions mise's config pins.
update mise install

if ((exit_code != 0)); then
  log "Error: One or more daily updates failed." >&2
  exit 1
fi

log "Daily updates completed successfully"
