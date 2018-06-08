# Alias common tmux functions.
alias td='tmux detach'
alias tl='tmux list-sessions 2>/dev/null; or true'
alias ts='tmux swap-window -t'

# If the session is in the list of current tmux sessions, it is attached. Otherwise, a new session
# is created and attached with the argument as its name.
function ta --description "Create or attach a tmux session"

  # Make sure tmuxinator is installed.
  if not type -q tmuxinator
    echo "Tmuxinator must be installed!"
    return 1
  end

  # Ensure the name of a session was provided.
  if test (count $argv) -ne 1
    echo "You must provide the name of the session to create or attach."
    return 1
  end

  # Create the session if it doesn't already exist.
  # https://superuser.com/questions/1174750/tmux-has-session-search-is-prefix-matching
  if not active_tmux_sessions | grep -Fx $argv[1] >/dev/null

    # Create the session using tmuxinator if a project exists for it. If the tmux session was
    # started successfully, we're done!
    if tmuxinator start $argv[1] 1>/dev/null 2>/dev/null
      return 0
    end

    # If a tmuxinator project does not exist, create a new session using my preferred layout
    tmux new-session -d -s $argv[1] 2>/dev/null
    tmux rename-window "working"
    tmux new-window -d -n vim 'nvim'
  end

  # If a tmux session is already attached, switch to the new session. Otherwise, attach the new
  # session.
  if test -n "$TMUX"
    tmux switch -t $argv[1]
  else
    tmux attach -t $argv[1]
  end
end

function tk --description "A wrapper for tmux kill-session"
  if test (count $argv) -ne 0
    tmux kill-session -t $argv[1]
  else
    tmux kill-session
  end
end

function tm --description "Move a tmux window to another position"
  set target_window (echo $argv[1])

  if test $target_window -lt 1; or test $target_window -gt (tmux_number_of_windows)
    echo -e "The target window must be between 1 and "(tmux_number_of_windows)"."
    return 1
  end
end

function active_tmux_sessions --description 'Lists all of the active Tmux sessions'
  tmux ls -F "#{session_name}" 2>/dev/null | cut -d: -f1
end

function tmux_sessions --description 'Lists all available sessions from Tmux and Tmuxinator'

  # Make sure tmuxinator is installed.
  if not type -q tmuxinator
    echo "Tmuxinator must be installed!"
    return 1
  end

  set tmuxinator_sessions (tmuxinator list | tail -n +2 | gsed -e 's/\s\+/\n/g')

  echo $tmuxinator_sessions (active_tmux_sessions) | gsed -e 's/\s\+/\n/g' | sort | uniq
end

function tmux_current_window
  tmux display-message -p '#I'
end

function tmux_number_of_windows
  tmux display-message -p '#{session_windows}'
end

complete --no-files --command ta --arguments '(tmux_sessions)'
complete --no-files --command tk --arguments '(active_tmux_sessions)'
