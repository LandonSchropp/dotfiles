# Add Homebrew to the PATH.
eval $(brew shellenv)

# Add Pyenv to the PATH.
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"

# Start up rbenv
eval "$(rbenv init -)"

# Add the local bin paths to the system path. This isn't included in the .zshenv file because it
# *must* be done after rbenv and nvm have loaded. Since we likely don't want relative paths in
# non-shell instances of zsh anyway, this is probably better anyway.
export PATH="./bin:./node_modules/.bin:$PATH"

# Add LunarVim to the path.
export PATH="$HOME/.local/bin:$PATH"
