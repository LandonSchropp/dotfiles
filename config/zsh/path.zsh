# Homebrew
export PATH="/opt/homebrew/bin:$PATH"
FPATH=$(brew --prefix)/share/zsh/site-functions:$FPATH

# direnv
eval "$(direnv hook zsh)"

# mise-en-place
eval "$(mise activate zsh)"

# thefuck
eval $(thefuck --alias)

# Add the Claude Code installation location to the path
export PATH="$HOME/.local/bin:$PATH"

# Add local bin scripts to the path
export PATH="./bin:$PATH"
export PATH="./node_modules/.bin:$PATH"
