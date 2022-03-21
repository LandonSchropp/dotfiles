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

# Add the Google Cloud utilities to the path.
source "$(brew --prefix)/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc"
source "$(brew --prefix)/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc"

# Enable Homebrew auto completions.
if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh/site-functions:$FPATH
fi
