#!/usr/bin/env bash

set -Eeuo pipefail

# Ensure git-town runs without requiring a TTY (e.g. under launchd). TERM=dumb keeps git from
# invoking a pager; GIT_EDITOR/GIT_SEQUENCE_EDITOR turn any editor launch into a no-op so a rebase
# step can't fail with "only a dumb terminal available".
export TERM=dumb
export GIT_EDITOR=true
export GIT_SEQUENCE_EDITOR=true

# Use nullglob so repository glob patterns that match nothing locally drop out silently rather than
# being passed through as a literal path.
shopt -s nullglob

# The repositories to sync.
repositories=(
  "$HOME/Development/agent-toolkit"
  "$HOME/Development/herdr-"*
  "$HOME/Development/obsidian-"*
  "$HOME/.dotfiles"
  "$HOME/Notes"
)

# Logging
log() {
  echo "[$(date '+%Y-%m-%d %H:%M:%S')] $*"
}

# Launches a herdr-project fix session for a repository whose sync failed.
request_fix() {
  local repository="$1"
  local name="$2"
  local project

  if ! project=$(herdr-project list --json | jq -r --arg path "$repository" '.[] | select(.path == $path) | .name'); then
    log "Error: failed to list herdr-project projects, skipping fix session for $name." >&2
    return
  fi

  if [[ -z "$project" ]]; then
    log "Error: no herdr-project configured for $name, skipping fix session." >&2
    return
  fi

  herdr-project open "$project" --worktree fix-sync --no-focus --prompt \
    "The daily sync's \`git-town sync\` failed in this repository and was backed out with \`git town undo\`. Reproduce and fix the failure (likely a rebase conflict) in the main worktree at $repository, not in this worktree. Once \`git-town sync\` succeeds there, close this worktree." ||
    log "Error: failed to open a herdr-project fix session for $name." >&2
}

# Syncs the default branch of a single repository via git-town, returning to the original branch
# when done. On failure, backs the sync out with `git town undo` so the repository is left clean for
# the next run, requests a fix session, and returns non-zero.
sync_repository() {
  local repository="$1"
  local name
  name=$(basename "$repository")

  if [[ ! -d "$repository" ]]; then
    log "$name not found at $repository, skipping..."
    return 0
  fi

  log "Syncing $name..."

  if ! cd "$repository"; then
    log "Error: failed to change into $repository." >&2
    return 1
  fi

  local -r original_branch=$(git branch --show-current)

  if ! git checkout "$(git default-branch)"; then
    log "Error: failed to check out the default branch in $name." >&2
    return 1
  fi

  if ! git-town sync; then
    log "Error: git-town sync failed in $name, backing out with git town undo." >&2
    git-town undo || log "Error: git town undo failed in $name." >&2
    git checkout "$original_branch" || true
    request_fix "$repository" "$name"
    return 1
  fi

  git checkout "$original_branch"
}

log "Starting repository sync..."

exit_code=0

for repository in "${repositories[@]}"; do
  sync_repository "$repository" || exit_code=1
done

if ((exit_code != 0)); then
  exit 1
fi

log "Repository sync completed successfully"
