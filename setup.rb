#!/usr/bin/env ruby

# This script installs all of the applications and configuration needed for my development 
# environment.
#
# Prerequisites:
#
# * Xcode
# * Xcode Command Line Tools
# * Sublime Text 2

require 'fileutils'
require 'pathname'

# Define the directories.
FILE_DIRECTORY = Pathname.new(File.dirname(__FILE__)).realpath.to_s 
SETTINGS_DIRECTORY = "#{FILE_DIRECTORY}/settings"
OH_MY_ZSH_DIRECTORY = Pathname.new(File.expand_path('~/.oh-my-zsh')).realpath.to_s
OH_MY_ZSH_CUSTOM_DIRECTORY = "#{OH_MY_ZSH_DIRECTORY}/custom"
SUBLIME_TEXT_USER_PREFERENCES_DIRECTORY = Pathname.new(File.expand_path(
  "~/Library/Application Support/Sublime Text 2/Packages/User")).realpath.to_s
SUBLIME_TEXT_USER_PREFERENCES_FILE = 
  "#{SUBLIME_TEXT_USER_PREFERENCES_DIRECTORY}/Preferences.sublime-settings"

# Install Homebrew.
`ruby <(curl -fsSkL raw.github.com/mxcl/homebrew/go)`
`brew doctor`

# Install and set up Git.
`brew install git`
`git config --global credential.helper osxkeychain`
`git config --global user.name "Landon Schropp"`
`git config --global user.email schroppl@gmail.com`
`git config --global alias.co checkout`
`git config --global alias.c commit`
`git config --global alias.b branch`
`git config --global alias.m merge`
`git config --global alias.s status`

# Install and set up Oh-My-Zsh.
`curl -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | sh`
if File.exists?(OH_MY_ZSH_CUSTOM_DIRECTORY) or File.symlink?(OH_MY_ZSH_CUSTOM_DIRECTORY)
  FileUtils.rm_r(OH_MY_ZSH_CUSTOM_DIRECTORY)
end

`ln -s #{SETTINGS_DIRECTORY + "/oh_my_zsh"} #{OH_MY_ZSH_CUSTOM_DIRECTORY}`
`source ~/.zshrc`

# Install GCC (Xcode ships with LLVM-GCC, which can cause problems when compiling Ruby).
`brew tap homebrew/dupes`
`brew install apple-gcc42`

# Install rbenv.
`brew install rbenv`
`brew install ruby-build`

# Install Ruby.
`CC="/usr/local/bin/gcc-4.2"`
`CFLAGS="-I/opt/X11/include"`
`rbenv install 1.9.3-p194`
`rbenv global 1.9.3-p194`
`eval "$(rbenv init -)"`

# Install Rails.
`gem install sqlite3`
`gem install rails`

# Install a few miscellaneous programs.
`brew install wget`
`brew install tree`

# Set up Sublime Text.
FileUtils.rm(SUBLIME_TEXT_USER_PREFERENCES_FILE) if File.exists?(SUBLIME_TEXT_USER_PREFERENCES_FILE)
File.symlink("#{SETTINGS_DIRECTORY}/sublime_text_2/Preferences.sublime-settings", 
  SUBLIME_TEXT_USER_PREFERENCES_FILE)
