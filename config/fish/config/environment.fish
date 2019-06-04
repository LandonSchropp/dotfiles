# Remove the greeting
set fish_greeting ""

# Start up rbenv
status --is-interactive; and source (rbenv init -|psub)

# Start up direnv
eval (direnv hook fish)

# Set the default text editor
set -gx EDITOR nvim

# Set up the local bin paths
set -gx PATH ./bin ./node_modules/.bin $PATH

# Set up my custom bin paths.
set -gx PATH $HOME/.dotfiles/bin $HOME/.dotfiles/bin/gcloud $PATH

# Enable source highlighting in less
set -gx LESSOPEN "| /usr/local/bin/src-hilite-lesspipe.sh %s"
set -gx LESS " -R "

# Add the kubernetes utilities to the path
source /usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.fish.inc

# Create a global way to determine the development directory
set -gx DEVELOPMENT_DIRECTORY "$HOME/Development"

# Make bat readable on a light terminal.
set -gx BAT_THEME "OneHalfLight"

# Source the asdf keybindings
source /usr/local/Cellar/asdf/*/asdf.fish
