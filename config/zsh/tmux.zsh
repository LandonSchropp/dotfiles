# shellcheck shell=bash

# Creates a tmux session if it doesn't already exist.
function tmux-create {
  local session_name="$1"

  # Ensure the name of a session was provided.
  if [ $# -ne 1 ]; then
    echo "You must provide the name of the session to create or attach."
    return 1
  fi

  # If the session already exists, then don't do anything.
  # https://superuser.com/questions/1174750/tmux-has-session-search-is-prefix-matching
  if tmux-list-active-sessions | grep -Fx "$session_name" >/dev/null; then
    return
  fi

  # If the session is available in tmuxinator, start it. Otherwise, fall back to the default
  # tmuxinator configuration.
  if tmuxinator-list-sessions | grep -Fx "$session_name" >/dev/null; then
    local config_name=$(
      ruby -r yaml -e 'print YAML.load(STDIN.read)["name"]' \
        < "$HOME/.config/tmuxinator/$session_name.yml"
    )

    if [ "$session_name" != "$config_name" ]; then
      echo "⛔️ The session name '$config_name' in $session_name.yaml must match the file name."
      return 1
    fi

    tmuxinator start --no-attach "$session_name"
  else
    tmuxinator start --no-attach -n "$session_name" default
  fi
}

# If the session is in the list of current tmux sessions, it is attached. Otherwise, a new session
# is created and attached with the argument as its name.
function tmux-create-and-attach {
  local session_name="$1"

  # Create the session if it doesn't already exist.
  tmux-create "$session_name" || return 1

  # If this command is being run from inside a session, switch to the target session. Otherwise,
  # attach to target session.
  if test -n "$TMUX"; then
    tmux switch -t "$session_name"
  else
    tmux attach -t "$session_name"
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
  local target_window="$(echo $argv[1])"

  if [ "$target_window" -lt 1 ] || [ "$target_window" -gt "$(tmux-number-of-windows)" ]; then
    echo -e "The target window must be between 1 and $(tmux-number-of-windows)."
    return 1
  fi

  local starting_window=$(tmux-current-window)

  if [ "$target_window" -lt "$(tmux-current-window)" ]; then
    for i in $(seq "$target_window" "$(tmux-current-window)"); do
      tmux swap-window -s "$starting_window" -t "$i"
    done
  fi

  if [ "$target_window" -gt "$starting_window" ]; then
    for i in $(seq "$target_window" "$starting_window"); do
      tmux swap-window -s "$starting_window" -t "$i"
    done
  fi

  tmux select-window -t "$target_window"
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
