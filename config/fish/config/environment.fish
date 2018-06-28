# Remove the greeting
set fish_greeting ""

# Start up rbenv
set -gx PATH $HOME/.rbenv/shims $PATH
rbenv rehash >/dev/null ^&1

# Start up direnv
eval (direnv hook fish)

# Set the default text editor
set -gx EDITOR nvim

# Set up the local bin paths
set -gx PATH ./bin ./node_modules/.bin $PATH

# Enable source highlighting in less
set -gx LESSOPEN "| /usr/local/bin/src-hilite-lesspipe.sh %s"
set -gx LESS " -R "

# Add the kubernetes utilities to the path
source /usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.fish.inc
