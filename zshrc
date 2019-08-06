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

# Start up NVM.
[ -s "$HOME/.nvm/nvm.sh" ] && . "$HOME/.nvm/nvm.sh"

# Enable source highlighting in less.
export LESSOPEN="| /usr/local/bin/src-hilite-lesspipe.sh %s"
export LESS=" -R "

# Add the Kubernetes utilities to the path.
source /usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc
source /usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc

# Make bat readable on a light terminal.
export BAT_THEME="ansi-dark"

# Enable Homebrew auto completions.
if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh/site-functions:$FPATH
fi

# Source the configuration files
for CONFIG_FILE in $HOME/.config/zsh/*; do
  source $CONFIG_FILE
done
