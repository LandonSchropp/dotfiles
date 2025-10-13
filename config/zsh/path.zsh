# Homebrew
export PATH="/opt/homebrew/bin:$PATH"
FPATH=$(brew --prefix)/share/zsh/site-functions:$FPATH

# direnv
eval "$(direnv hook zsh)"

# mise-en-place
eval "$(mise activate zsh --shims)"
eval "$(mise activate zsh)"

# pnpm
export PNPM_HOME="$HOME/.local/share/pnpm"
export PATH="$PNPM_HOME:$PATH"

# thefuck
eval $(thefuck --alias)

# Claude Code
export PATH="$HOME/.local/bin:$PATH"

# Local bin scripts
export PATH="./bin:$PATH"
export PATH="./node_modules/.bin:$PATH"
