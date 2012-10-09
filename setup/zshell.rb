#!/usr/bin/env ruby

# Installs and sets up Oh-My-Zsh.

require 'fileutils'
require 'pathname'

# define the directories
FILE_DIRECTORY = Pathname.new(File.dirname(__FILE__)).realpath.to_s 
SETTINGS_DIRECTORY = "#{FILE_DIRECTORY}/settings"
OH_MY_ZSH_DIRECTORY = Pathname.new(File.expand_path('~/.oh-my-zsh')).realpath.to_s
OH_MY_ZSH_CUSTOM_DIRECTORY = "#{OH_MY_ZSH_DIRECTORY}/custom"

# install oh-my-zsh
`curl -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | sh`
if File.exists?(OH_MY_ZSH_CUSTOM_DIRECTORY) or File.symlink?(OH_MY_ZSH_CUSTOM_DIRECTORY)
  FileUtils.rm_r(OH_MY_ZSH_CUSTOM_DIRECTORY)
end

# symbolically link the directories
`ln -s #{SETTINGS_DIRECTORY + "/oh_my_zsh"} #{OH_MY_ZSH_CUSTOM_DIRECTORY}`
`source ~/.zshrc`