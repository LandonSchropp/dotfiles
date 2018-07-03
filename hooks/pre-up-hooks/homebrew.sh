# Install Homebrew if it has not already been installed
if ! command -v base16-builder 2>/dev/null; then
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Install all of the Homebrew applications
brew bundle --file="$HOME/.dotfiles/Brewfile"
