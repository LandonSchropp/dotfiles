# set the default text editor
export EDITOR="vim"

# set the lolcommits delay
export LOLCOMMITS_DELAY=1

# start up rbenv
eval "$(rbenv init -)"

# set up the local bin path
export PATH="/usr/local/heroku/bin:$PATH"
export PATH=./bin:$PATH

# set up andoird path
export ANDROID_HOME=/usr/local/opt/android-sdk

# Remove the delay when hitting the escape key
export KEYTIMEOUT=1

# Configure cd paths
setopt auto_cd
cdpath=($HOME $HOME/Development)
