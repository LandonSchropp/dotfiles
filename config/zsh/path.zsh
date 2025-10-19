# NOTE: Some essential $PATH entries are set in .zshenv so they're available to non-interactive
# shells.

# Homebrew
FPATH=$(brew --prefix)/share/zsh/site-functions:$FPATH

# direnv
eval "$(direnv hook zsh)"

# mise-en-place
eval "$(mise activate zsh)"

# Local bin scripts
export PATH="./bin:$PATH"
export PATH="./node_modules/.bin:$PATH"
