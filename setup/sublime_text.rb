#!/usr/bin/env ruby

# Sets up Sublime Text.

require 'fileutils'
require 'pathname'

# define the directories
FILE_DIRECTORY = Pathname.new(File.dirname(__FILE__)).to_s 
SETTINGS_DIRECTORY = "#{FILE_DIRECTORY}/settings"
SUBLIME_TEXT_USER_PREFERENCES_DIRECTORY = Pathname.new(File.expand_path(
  "~/Library/Application Support/Sublime Text 2/Packages/User")).to_s
SUBLIME_TEXT_USER_PREFERENCES_FILE = 
  "#{SUBLIME_TEXT_USER_PREFERENCES_DIRECTORY}/Preferences.sublime-settings"

set up sublime text 2
FileUtils.rm(SUBLIME_TEXT_USER_PREFERENCES_FILE) if File.exists?(SUBLIME_TEXT_USER_PREFERENCES_FILE)
File.symlink("#{SETTINGS_DIRECTORY}/sublime_text_2/Preferences.sublime-settings", 
  SUBLIME_TEXT_USER_PREFERENCES_FILE)
`cd ~/Library/Application\ Support/Sublime\ Text\ 2/Packages`
`git clone -b SublimeText2 git://github.com/kuroir/SCSS.tmbundle.git SCSS`