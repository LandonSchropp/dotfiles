# Source Prezto.
source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"

# Undo the Prezto -i aliases
alias cp='nocorrect cp'
alias ln='nocorrect ln'
alias mv='nocorrect mv'
alias rm='nocorrect rm'

# Disable nomatch (https://github.com/ohmyzsh/ohmyzsh/issues/449)
unsetopt nomatch

# Start up rbenv
eval "$(rbenv init -)"

# Start up direnv
eval "$(direnv hook zsh)"

# Start up NVM. These instructions come from the Homebrew caveats section.
# https://github.com/Homebrew/homebrew-core/blob/master/Formula/nvm.rb
export NVM_DIR="$HOME/.nvm"
source "$(brew --prefix nvm)/nvm.sh"
source "$(brew --prefix nvm)/etc/bash_completion.d/nvm"

# Add the local bin paths to the system path. This isn't included in the .zshenv file because it
# *must* be done after rbenv and nvm have loaded. Since we likely don't want relative paths in
# non-shell instances of zsh anyway, this is probably better anyway.
export PATH="./bin:./node_modules/.bin:$PATH"

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
