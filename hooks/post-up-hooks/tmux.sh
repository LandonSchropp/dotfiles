# Install tpm unless it already exists
if [ ! -d "$HOME/.tmux/plugins/tpm" ]; then
  git clone https://github.com/tmux-plugins/tpm "$HOME/.tmux/plugins/tpm"
  $HOME/.tmux/plugins/tpm/bin/install_plugins
fi

# Install Tmuxinator
gem install tmuxinator
