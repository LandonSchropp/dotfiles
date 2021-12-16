# shellcheck shell=bash

# Creates a tmux session if it doesn't already exist.
function tmux-create {
  SESSION_NAME="$1"

  # Ensure the name of a session was provided.
  if [ $# -ne 1 ]; then
    echo "You must provide the name of the session to create or attach."
    return 1
  fi

  # If the session already exists, then don't do anything.
  # https://superuser.com/questions/1174750/tmux-has-session-search-is-prefix-matching
  if tmux-list-active-sessions | grep -Fx "$SESSION_NAME" >/dev/null; then
    return
  fi

  # If the session is available in tmuxinator, start it. Otherwise, fall back to the default
  # tmuxinator configuration.
  if tmuxinator-list-sessions | grep -Fx "$SESSION_NAME" >/dev/null; then
    tmuxinator start --no-attach "$SESSION_NAME"
  else
    tmuxinator start --no-attach -n "$SESSION_NAME" default
  fi
}

# If the session is in the list of current tmux sessions, it is attached. Otherwise, a new session
# is created and attached with the argument as its name.
function tmux-create-and-attach {
  SESSION_NAME="$1"

  # Create the session if it doesn't already exist.
  tmux-create "$SESSION_NAME" || return 1

  # If this command is being run from inside a session, switch to the target session. Otherwise,
  # attach to target session.
  if test -n "$TMUX"; then
    tmux switch -t "$SESSION_NAME"
  else
    tmux attach -t "$SESSION_NAME"
  fi
}

# A wrapper for tmux kill-session
function tmux-kill {
  if [ $# -ne 0 ]; then
    tmux kill-session -t $argv[1]
  else
    tmux kill-session
  fi
}

# Move a tmux window to another position
function tmux-move {

  TARGET_WINDOW="$(echo $argv[1])"

  if [ "$TARGET_WINDOW" -lt 1 ] || [ "$TARGET_WINDOW" -gt "$(tmux-number-of-windows)" ]; then
    echo -e "The target window must be between 1 and $(tmux-number-of-windows)."
    return 1
  fi

  STARTING_WINDOW=$(tmux-current-window)

  if [ "$TARGET_WINDOW" -lt "$(tmux-current-window)" ]; then
    for i in $(seq "$TARGET_WINDOW" "$(tmux-current-window)"); do
      tmux swap-window -s "$STARTING_WINDOW" -t "$i"
    done
  fi

  if [ "$TARGET_WINDOW" -gt "$STARTING_WINDOW" ]; then
    for i in $(seq "$TARGET_WINDOW" "$STARTING_WINDOW"); do
      tmux swap-window -s "$STARTING_WINDOW" -t "$i"
    done
  fi

  tmux select-window -t "$TARGET_WINDOW"
}

# Lists all of the preset Tmux sessions.
function tmuxinator-list-sessions {
  tmuxinator list --newline | tail -n +2
}

# Lists all of the active Tmux sessions.
function tmux-list-active-sessions {
  tmux ls -F "#{session_name}" 2>/dev/null | cut -d: -f1
}

# Lists all available sessions from Tmux and Tmuxinator.
function tmux-sessions {
  echo "$(tmuxinator-list-sessions)" "$(tmux-list-active-sessions)" \
    | gsed -e 's/\s\+/\n/g' | sort | uniq
}

# Returns the current window number.
function tmux-current-window {
  tmux display-message -p '#I'
}

# Returns the number of windows in the current session.
function tmux-number-of-windows {
  tmux display-message -p '#{session_windows}'
}

# Kill all tmux sessions.
function tmux-kill-all {
  for session in $(tmux-list-active-sessions); do
    tmux-kill "$session"
  done
}

# Define aliases for the functions.
alias ta="tmux-create-and-attach"
alias td="tmux detach"
alias tk="tmux-kill"
alias tka="tmux-kill-all"
alias tl="tmux-list-active-sessions"
alias tm="tmux-move"
