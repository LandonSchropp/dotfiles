# rbenv
eval "$(rbenv init -)"

# pyenv
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

# direnv
eval "$(direnv hook zsh)"

# fnm
eval "$(fnm env --use-on-cd)"

# thefuck
eval $(thefuck --alias)

# Bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
[ -s "/Users/landon/.bun/_bun" ] && source "/Users/landon/.bun/_bun"

# Rust
if test -f "$HOME/.cargo/env"; then
  source "$HOME/.cargo/env"
fi

# Homebrew
if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh/site-functions:$FPATH
fi

# Add my custom bin scripts to the path. This must go at the bottom to have a higher precedence than
# other directories in the path.
export PATH="$HOME/.dotfiles/bin:$PATH"
export PATH="$HOME/.dotfiles/bin/gcloud:$PATH"
export PATH="$HOME/.dotfiles/bin/git:$PATH"

# Add local bin scripts to the path
export PATH="./bin:$PATH"
export PATH="./node_modules/.bin:$PATH"
