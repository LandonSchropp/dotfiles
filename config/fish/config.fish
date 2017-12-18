# Source the other configuration files.
source $HOME/.config/fish/docker.fish

# Kick off rbenv
set PATH $HOME/.rbenv/bin $PATH
set PATH $HOME/.rbenv/shims $PATH
rbenv rehash >/dev/null ^&1
