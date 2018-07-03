# Install Fisherman unless it's already installed
if [ ! -f "$HOME/config/fish/functions/fisher.fish" ]; then
  curl -Lo "$HOME/config/fish/functions/fisher.fish" --create-dirs https://git.io/fisher
fi

# Install the Fisherman plugins
fish -c fisher
