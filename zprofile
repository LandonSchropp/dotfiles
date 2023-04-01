# Add Homebrew to the PATH.
if [ -f "/opt/homebrew/bin/brew" ]; then
  eval $(/opt/homebrew/bin/brew shellenv)
else
  eval $(/usr/local/bin/brew shellenv)
fi

# Add Pyenv to the PATH.
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"

# Start up rbenv
eval "$(rbenv init -)"

# Add the local bin paths to the system path. This isn't included in the .zshenv file because it
# *must* be done after rbenv and fnm have loaded. Since we likely don't want relative paths in
# non-shell instances of zsh anyway, this is probably better anyway.
export PATH="./bin:./node_modules/.bin:$PATH"

# Increase the maximum number of open files.
ulimit -n 10485760
