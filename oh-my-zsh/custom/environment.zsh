# set the default text editor
export EDITOR="nvim"

# set the lolcommits delay
export LOLCOMMITS_DELAY=1

# start up rbenv
eval "$(rbenv init -)"

# start up direnv
eval "$(direnv hook zsh)"

# set up the local bin paths
export PATH="./bin:./node_modules/.bin:/usr/local/heroku/bin:$PATH"

# set up andoird path
export ANDROID_HOME=/usr/local/opt/android-sdk

# Remove the delay when hitting the escape key
export KEYTIMEOUT=1

# Configure cd paths
setopt auto_cd
cdpath=($HOME $HOME/Development)

# Prevent Zsh from exiting the shell when Control-D is pressed
set -o ignoreeof

# Enable source highlighting in less
export LESSOPEN="| /usr/local/bin/src-hilite-lesspipe.sh %s"
export LESS=" -R "
