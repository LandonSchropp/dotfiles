#!/usr/bin/env ruby

# Sets up the symbolic links for Dropbox.
#
# Prerequisits:
# * Dropbox

require 'fileutils'
require 'pathname'

DROPBOX_DIRECTORY = Pathname.new(File.expand_path("~/Dropbox")).realpath.to_s

# Set up the symbolic links.
File.symlink("#{DROPBOX_DIRECTORY}/Development", "#{ENV["HOME"]}/Development")