# If the session is in the list of current tmux sessions, it is attached. Otherwise, a new session
# is created and attached with the argument as its name.
ta() {

  # ensure the name of a session was provided
  if [[ $# -eq 0 ]]; then
    echo "You must provide the name of the session to create or attach."
    return 1
  fi

  # create the session if it doesn't already exist
  tmux has-session -t $1 2>/dev/null
  if [[ $? != 0 ]]; then

    # create the session using tmuxinator if a project exists for it
    tmuxinator start $1 2>/dev/null

    # if the tmuxinator session was started successfully, we're done!
    if [[ $? == 0 ]]; then
      return 0
    fi

    # if a tmuxinator project does not exist, create a new session
    tmux new-session -d -s $1
    tmux rename-window "working"
  fi

  # if a tmux session is already attached, switch to the new session; otherwise, attach the new
  # session
  if { [[ "$TERM" == "screen" ]] && [ -n "$TMUX" ]; } then
    tmux switch -t $1
  else
    tmux attach -t $1
  fi
}

# Kills the provided session, or the current session if no session is provided.
tk() {
  if [[ $# == 0 ]]; then
    tmux kill-session
  else
    tmux kill-session -t $1
  fi
}

# Provides the tmux sessions for autofill.
tmux-list-sessions-autofill() {

  # get the tmux and tmuxinator sessions
  TMUX_SESSIONS=$( tmux list-sessions | cut -d: -f1 )
  TMUXINATOR_SESSIONS=$( tmuxinator list | tail -n +2 | gsed -e 's/\s\+/\n/g' )

  # remove duplicates
  SESSIONS=$( echo "$TMUX_SESSIONS\n$TMUXINATOR_SESSIONS" | sort | uniq )

  # set the autocomplete values
  reply=( $(echo $SESSIONS) )
}

alias -g td='tmux detach'
alias -g tl='tmux list-sessions'

# Add autocomplete to the custom tmux functions.
compctl -K tmux-list-sessions-autofill ta
compctl -K tmux-list-sessions-autofill tk