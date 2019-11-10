# Alias common tmux functions.
alias td='tmux detach'
alias tl='tmux list-sessions 2>/dev/null || 0'

# If the session is in the list of current tmux sessions, it is attached. Otherwise, a new session
# is created and attached with the argument as its name.
function ta {

  # Ensure the name of a session was provided.
  if [ $# -ne 1 ]; then
    echo "You must provide the name of the session to create or attach."
    return 1
  fi

  # Create the session if it doesn't already exist.
  # https://superuser.com/questions/1174750/tmux-has-session-search-is-prefix-matching
  if ! active_tmux_sessions | grep -Fx "$1" >/dev/null; then

    # Create the session using tmuxinator if a project exists for it. If the tmux session was
    # started successfully, we're done!
    if tmuxinator start "$1"; then
      return 0
    fi

    # If a tmuxinator project does not exist, create a new session using my preferred layout
    tmux new-session -d -s "$1" 2>/dev/null
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

  if [ $TARGET_WINDOW -lt 1; or test $TARGET_WINDOW -gt $(tmux_number_of_windows) ]; then
    echo -e "The target window must be between 1 and "$(tmux_number_of_windows)"."
    return 1
  fi

  if [ $TARGET_WINDOW -lt $(tmux_current_window) ]; then
    for i in $(seq $TARGET_WINDOW $(math $(tmux_current_window) - 1)); do
      tmux swap-window -d -s $(tmux_current_window) -t $i
    done
  fi

  if [ $TARGET_WINDOW -gt $(tmux_current_window) ]; then
    for i in $(seq $TARGET_WINDOW $(math $(tmux_current_window) + 1)); do
      tmux swap-window -d -s $(tmux_current_window) -t $i
    done
  fi

  tmux select-window -t $TARGET_WINDOW
}

# Lists all of the active Tmux sessions
function active_tmux_sessions {
  tmux ls -F "#{session_name}" 2>/dev/null | cut -d: -f1
}

# Lists all available sessions from Tmux and Tmuxinator
function tmux_sessions {

  # Make sure tmuxinator is installed.
  if ! type tmuxinator &>/dev/null; then
    echo "Tmuxinator must be installed!"
    return 1
  fi

  TMUXINATOR_SESSIONS="$(tmuxinator list | tail -n +2 | gsed -e 's/\s\+/\n/g')"

  echo $TMUXINATOR_SESSIONS $(active_tmux_sessions) | gsed -e 's/\s\+/\n/g' | sort | uniq
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
