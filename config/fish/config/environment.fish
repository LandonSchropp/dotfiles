# Start up rbenv
set -gx PATH $HOME/.rbenv/bin $PATH
set -gx PATH $HOME/.rbenv/shims $PATH
rbenv rehash >/dev/null ^&1

# Start up direnv
eval (direnv hook fish)

# Start up NVM
# TODO: This seems to significantly slow down startup time. Investigate alternatives.
test -e "$HOME/.nvm"; and bass source "$HOME/.nvm/nvm.sh"

# Set the default text editor
set -gx EDITOR nvim

# Set up the local bin paths
set -gx PATH ./bin ./node_modules/.bin $PATH

# Enable source highlighting in less
set -gx LESSOPEN "| /usr/local/bin/src-hilite-lesspipe.sh %s"
set -gx LESS " -R "
