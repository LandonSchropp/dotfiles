# Homebrew
export PATH="/opt/homebrew/bin:$PATH"
FPATH=$(brew --prefix)/share/zsh/site-functions:$FPATH

# mise-en-place
eval "$(mise activate zsh)"

# thefuck
eval $(thefuck --alias)

# Bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

if [ -s "/Users/landon/.bun/_bun" ]; then
  source "/Users/landon/.bun/_bun"
fi

# Rust
if test -f "$HOME/.cargo/env"; then
  source "$HOME/.cargo/env"
fi

# Deno
if test -f "$HOME/.deno/env"; then
  if [[ ":$FPATH:" != *":/Users/landon/.zsh/completions:"* ]]; then
    export FPATH="/Users/landon/.zsh/completions:$FPATH"
  fi

  source "$HOME/.deno/env"
  autoload -Uz compinit
  compinit
fi

# Add local bin scripts to the path
export PATH="./bin:$PATH"
export PATH="./node_modules/.bin:$PATH"
