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

# Waits for a full wake, when the display is on, rather than running during a brief dark wake.
until [[ $(pmset -g systemstate) == *Graphics* ]]; do
  sleep 60
done

log "Starting daily updates..."

update sync-repositories
update sync-dictionaries
update check-notes-file-sizes
update tldr --update

# Installs any tool in mise's config that isn't there yet.
update mise install

if ((exit_code != 0)); then
  log "Error: One or more daily updates failed." >&2
  exit 1
fi

log "Daily updates completed successfully"
