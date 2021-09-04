# Start up rbenv
eval "$(rbenv init -)"

# Start up pyenv
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

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

# Add the Google Cloud utilities to the path.
source /usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc
source /usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc

# Enable Homebrew auto completions.
if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh/site-functions:$FPATH
fi

# Add LunarVim to the path.
export PATH="$HOME/.local/bin:$PATH"
