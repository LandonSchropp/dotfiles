# Start up pyenv
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

# Start up direnv
eval "$(direnv hook zsh)"

# Start up fnm.
eval "$(fnm env --use-on-cd)"

# Enable Homebrew auto completions.
if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh/site-functions:$FPATH
fi
