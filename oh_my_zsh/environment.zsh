# set up NodeJS environment
export NODE_PATH="/usr/local/lib/node:/usr/local/lib/node_modules"

# set the default text editor
export EDITOR="/Applications/Sublime\ Text\ 2.app/Contents/SharedSupport/bin/subl"

# sublime text symbolic link
rm -f /usr/local/bin/subl
ln -s "/Applications/Sublime Text 2.app/Contents/SharedSupport/bin/subl" /usr/local/bin/subl

# set up the path so brew programs override local programs
export PATH=/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin:$PATH

# start up rbenv
eval "$(rbenv init -)"