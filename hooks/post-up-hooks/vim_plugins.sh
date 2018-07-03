#!/usr/bin/env bash

set -e

# Download Plug
if [ ! -e "$HOME"/.config/nvim/autoload/plug.vim ]; then
  curl -fLo "$HOME"/.config/nvim/autoload/plug.vim --create-dirs \
      https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

# Install the Python Neovim plugin
pip3 install neovim

# Install the plugins listed in the plugins.vim file
nvim -u "$HOME"/.config/nvim/plugins.vim +PlugInstall +PlugClean! +qa
