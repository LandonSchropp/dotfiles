#!/usr/bin/env ruby

# Installs and sets up Oh-My-Zsh.

require 'fileutils'
require 'pathname'

# define the directories
FILE_DIRECTORY = Pathname.new(File.dirname(__FILE__)).realpath.to_s 
SETTINGS_DIRECTORY = Pathname.new(File.expand_path("#{FILE_DIRECTORY}/../settings")).to_s
OH_MY_ZSH_DIRECTORY = Pathname.new(File.expand_path('~/.oh-my-zsh')).to_s
OH_MY_ZSH_CUSTOM_DIRECTORY = "#{OH_MY_ZSH_DIRECTORY}/custom"

# install oh-my-zsh
`curl -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | sh`
if File.exists?(OH_MY_ZSH_CUSTOM_DIRECTORY) or File.symlink?(OH_MY_ZSH_CUSTOM_DIRECTORY)
  FileUtils.rm_r(OH_MY_ZSH_CUSTOM_DIRECTORY)
end

# symbolically link the directories
FileUtils.mkdir_p OH_MY_ZSH_CUSTOM_DIRECTORY
`ln -s #{SETTINGS_DIRECTORY + "/oh_my_zsh/zsh.zsh"} #{OH_MY_ZSH_CUSTOM_DIRECTORY}`

# start zshell
`/bin/zsh`
`source ~/.zshrc`