#!/usr/bin/env ruby

# This script installs all of the applications and configuration needed for my personal development 
# environment.
#
# Installed prerequisites:
#
# * Xcode
# * Xcode Command Line Tools
# * Sublime Text 2
# * Dropbox
# * MacRuby

require 'fileutils'
require 'pathname'

`ruby homebrew.rb`
`ruby git.rb`
`ruby zshell.rb`
`ruby gcc.rb`
`ruby ruby.rb`
`ruby ruby_on_rails.rb`
`ruby sublime_text.rb`
`ruby dropbox.rb`
`ruby miscellaneous.rb`
`ruby node_js.rb`
`ruby postgresql.rb`