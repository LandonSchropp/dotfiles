# set up NodeJS environment
export NODE_PATH="/usr/local/lib/node:/usr/local/lib/node_modules:/usr/local/share/npm/bin:/usr/local/share/npm/lib/node_modules"

# set the default text editor
export EDITOR="/usr/local/bin/atom"

# set up the path so brew programs override local programs
export PATH=./bin:/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin:$NODE_PATH:$PATH

# start up rbenv
eval "$(rbenv init -)"