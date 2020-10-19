# Source Prezto.
source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"

# Undo the Prezto -i aliases
alias cp='nocorrect cp'
alias ln='nocorrect ln'
alias mv='nocorrect mv'
alias rm='nocorrect rm'

# Disable nomatch. (https://github.com/ohmyzsh/ohmyzsh/issues/449)
unsetopt nomatch

# Disable autocorrection. (It produces annoying error messages).
unsetopt correct

# Enable source highlighting in less.
export LESSOPEN="| /usr/local/bin/src-hilite-lesspipe.sh %s"
export LESS=" -R "

# Make bat readable on a light terminal.
export BAT_THEME="ansi-dark"

# Source the configuration files
for CONFIG_FILE in $HOME/.config/zsh/*; do
  source $CONFIG_FILE
done
