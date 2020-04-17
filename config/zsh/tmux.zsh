TMUX_PRESETS_CONFIGURATION=~/Google\ Drive/Configuration/tmux-presets.json

# Alias common tmux functions.
alias td='tmux detach'

function tl() {
  tmux list-sessions 2>/dev/null || true
}

# If the session is in the list of current tmux sessions, it is attached. Otherwise, a new session
# is created and attached with the argument as its name.
function ta {

  # Ensure the name of a session was provided.
  if [ $# -ne 1 ]; then
    echo "You must provide the name of the session to create or attach."
    return 1
  fi

  SESSION_NAME="$1"

  # Create the session if it doesn't already exist.
  # https://superuser.com/questions/1174750/tmux-has-session-search-is-prefix-matching
  if ! active_tmux_sessions | grep -Fx "$1" >/dev/null; then

    # Grab the directory from the tmux presets if it exists.
    DIRECTORY=$(
      jq \
        --arg name "$SESSION_NAME" \
        -r \
        '.[] | select(.name == $name) | .directory' \
        $TMUX_PRESETS_CONFIGURATION
    )

    # If the directory is empty, then use the current working directory.
    DIRECTORY=$(test -z "$DIRECTORY" && pwd || echo "$DIRECTORY")

    # Create a new session using my preferred two-window layout.
    tmux new-session -d -c "$DIRECTORY" -s "$SESSION_NAME"
    # 2>/dev/null
    tmux rename-window "working"
    tmux new-window -d -n vim 'nvim'
  fi

  # If a tmux session is already attached, switch to the new session. Otherwise, attach the new
  # session.
  if test -n "$TMUX"; then
    tmux switch -t $argv[1]
  else
    tmux attach -t $argv[1]
  fi
}

# A wrapper for tmux kill-session
function tk {
  if [ $# -ne 0 ]; then
    tmux kill-session -t $argv[1]
  else
    tmux kill-session
  fi
}

# Move a tmux window to another position
function tm {

  TARGET_WINDOW="$(echo $argv[1])"

  if [ $TARGET_WINDOW -lt 1 ] || [ $TARGET_WINDOW -gt $(tmux_number_of_windows) ]; then
    echo -e "The target window must be between 1 and "$(tmux_number_of_windows)"."
    return 1
  fi

  STARTING_WINDOW=$(tmux_current_window)

  if [ $TARGET_WINDOW -lt $(tmux_current_window) ]; then
    for i in $(seq $TARGET_WINDOW $(tmux_current_window)); do
      tmux swap-window -s $STARTING_WINDOW -t $i
    done
  fi

  if [ $TARGET_WINDOW -gt $STARTING_WINDOW ]; then
    for i in $(seq $TARGET_WINDOW $STARTING_WINDOW); do
      tmux swap-window -s $STARTING_WINDOW -t $i
    done
  fi

  tmux select-window -t $TARGET_WINDOW
}

# Lists all of the preset Tmux sessions.
function preset_tmux_sessions {
  jq -r 'map(.name) | sort | .[]' "$TMUX_PRESETS_CONFIGURATION"
}

# Lists all of the active Tmux sessions.
function active_tmux_sessions {
  tmux ls -F "#{session_name}" 2>/dev/null | cut -d: -f1
}

# Lists all available sessions from Tmux and the Tmux presets.
function tmux_sessions {
  echo $(preset_tmux_sessions) $(active_tmux_sessions) | gsed -e 's/\s\+/\n/g' | sort | uniq
}

function tmux_current_window {
  tmux display-message -p '#I'
}

function tmux_number_of_windows {
  tmux display-message -p '#{session_windows}'
}

complete --no-files --command ta --arguments '(tmux_sessions)'
complete --no-files --command tk --arguments '(active_tmux_sessions)'

# Kill all tmux sessions.
function tka {
  for session in $(active_tmux_sessions); do
    tk $session
  done
}
