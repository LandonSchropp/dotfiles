# Install Homebrew if it has not already been installed
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Install all of the Homebrew applications
brew bundle --file=$HOME/.dotfiles/Brewfile
