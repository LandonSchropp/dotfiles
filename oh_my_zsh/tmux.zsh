# If the session is in the list of current tmux sessions, it is attached. Otherwise, a new session 
# is created and attached with the argument as its name.
ta() {

  # create the session if it doesn't already exist
  tmux has-session -t $1 2>/dev/null
  if [[ $? != 0 ]]; then
    tmux new-session -d -s $1
  fi

  # if a tmux session is already attached, switch to the new session; otherwise, attach the new
  # session
  if { [ "$TERM" = "screen" ] && [ -n "$TMUX" ]; } then
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
  reply=( $(tmux list-sessions | cut -d: -f1) )
}

alias -g td='tmux detach'
alias -g tl='tmux list-sessions'

# Add autocomplete to the custom tmux functions.
compctl -K tmux-list-sessions-autofill ta
compctl -K tmux-list-sessions-autofill tk