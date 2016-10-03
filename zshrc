# Source Prezto.
source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"

# Start up rbenv
eval "$(rbenv init -)"

# Start up direnv
eval "$(direnv hook zsh)"

# Set up and load NVM
export NVM_DIR="/Users/landon/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"

# Source the configuration files
for config_file in $HOME/.dotfiles/zsh/*; do
  source config_file
done
