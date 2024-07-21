# pyenv
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

# direnv
eval "$(direnv hook zsh)"

# fnm
eval "$(fnm env --use-on-cd)"

# Zoxide
eval "$(zoxide init zsh)"

# thefuck
eval $(thefuck --alias)

# Bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
[ -s "/Users/landon/.bun/_bun" ] && source "/Users/landon/.bun/_bun"

# Homebrew
if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh/site-functions:$FPATH
fi
