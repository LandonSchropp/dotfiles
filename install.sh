#!/bin/sh

# This script installs all of the command line applications and configuration needed for my personal
# development environment.

# Define the directories.
SCRIPTS_DIRECTORY=~/scripts
SETTINGS_DIRECTORY=~/settings

# Install Homebrew.
ruby <(curl -fsSkL raw.github.com/mxcl/homebrew/go)
brew doctor

# Install and set up Git.
brew install git
git config --global credential.helper osxkeychain
git config --global user.name "Landon Schropp"
git config --global user.email schroppl@gmail.com
git config --global alias.co checkout
git config --global alias.c commit
git config --global alias.b branch
git config --global alias.m merge
git config --global alias.s status

# Install and set up Oh-My-Zsh.
curl -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | sh
rm -r ~/.oh-my-zsh/custom
ln -s $SETTINGS_DIRECTORY/oh-my-zsh ~/.oh-my-zsh/custom

# Install GCC (Xcode ships with LLVM-GCC, which can cause problems when compiling Ruby).
brew tap homebrew/dupes
brew install apple-gcc42

# Install rbenv.
brew install rbenv
brew install ruby-build

# Install Ruby.
CC="/usr/local/bin/gcc-4.2"
CFLAGS="-I/opt/X11/include"
rbenv install 1.9.3-p194
rbenv global 1.9.3-p194
eval "$(rbenv init -)"

# Install Rails.
gem install sqlite3
gem install rails

# Install a few miscellaneous programs.
brew install wget
brew install tree