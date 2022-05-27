# This theme is built on top of the Agnoster theme.
source "$ZSH/themes/agnoster.zsh-theme"

# Hide parts of the prompt.
prompt_status() {}
prompt_context() {}

# Customize the build prompt, substituting colors so they match my personal theme.
custom_build_prompt() {
  build_prompt \
    | ruby -pe 'gsub(/yellow|green/, "13")' \
    | ruby -pe 'gsub("±", "*")' \
    | ruby -pe 'gsub("✚", "+")'
}

# Override the $PROMPT variable so it uses the custom prompt function.
PROMPT='%{%f%b%k%}$(custom_build_prompt) '

# Add color to the substitution prompt.
SPROMPT='Correct %F{red}%R%f to %F{green}%r%f [nyae]? '

# Given a number and a unit, this function concatenates them and pluralizes the unit. If the number
# is 0, this function doesn't output anything.
function pluralize {
  if [[ $1 -eq 0 ]]; then return; fi
  printf "%s %s%s" $1 $2 $([[ $1 -eq 1 ]] || echo -n "s")
}

# Given a number of seconds, this function prints the total time in a human-readable format.
function print_time {
  let "TIME_HOURS = $1 / 3600"
  let "TIME_MINUTES = $1 / 60 % 60"
  let "TIME_SECONDS = $1 % 60"

  PLURALIZED_HOURS=$(pluralize $TIME_HOURS "hour")
  PLURALIZED_MINUTES=$(pluralize $TIME_MINUTES "minute")
  PLURALIZED_SECONDS=$(pluralize $TIME_SECONDS "second")

  TIMES=($PLURALIZED_HOURS $PLURALIZED_MINUTES $PLURALIZED_SECONDS)
  echo -n $TIMES
}

# Sets the start time of the command.
function prompt_landon_preexec {
  START_TIME=$SECONDS
}

# When the command finishes executing, this function prints the time if it's greater than 10
# seconds.
function prompt_landon_precmd {
  setopt LOCAL_OPTIONS
  unsetopt XTRACE KSH_ARRAYS

  # When the shell is loading, precmd can run without a start time being set. This prevents an error
  # in that case.
  if [ -z "$START_TIME" ]; then
    return
  fi

  # Determine the how long the timer has run
  TIMER_RESULT=$(($SECONDS - $START_TIME))

  # Print the time if it's been longer than 10 seconds.
  if [[ $TIMER_RESULT -gt 10 ]]; then
    print -P "%B%F{blue}🕐 $(print_time TIMER_RESULT)"
  fi
}

# Add the timer hooks.
add-zsh-hook preexec prompt_landon_preexec
add-zsh-hook precmd prompt_landon_precmd
