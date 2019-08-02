# Source Prezto.
source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"

# Undo the Prezto -i aliases
alias cp='nocorrect cp'
alias ln='nocorrect ln'
alias mv='nocorrect mv'
alias rm='nocorrect rm'

# Start up rbenv
eval "$(rbenv init -)"

# Start up direnv
eval "$(direnv hook zsh)"

# Set up and load NVM
export NVM_DIR="/Users/landon/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"

# Source the configuration files
for CONFIG_FILE in $HOME/.config/zsh/*; do
  source $CONFIG_FILE
done
