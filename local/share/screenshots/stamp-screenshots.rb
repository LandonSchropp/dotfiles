#!/usr/bin/env ruby

# frozen_string_literal: true

# Points newly added images in the screenshots directory at Shottr, so opening one from Finder
# opens it for editing. macOS binds applications to file types, not to folders, so the binding has
# to be applied per file. Images elsewhere on the system are unaffected.

require 'fileutils'

SCREENSHOTS_DIRECTORY = File.join(Dir.home, 'Screenshots')
HANDLER_PLIST_PATH = File.join(__dir__, 'shottr-handler.plist')
ATTRIBUTE = 'com.apple.LaunchServices.OpenWith'
EXTENSIONS = %w[png jpg jpeg heic].freeze

# An empty XDG_CACHE_HOME means the same thing as an unset one.
CACHE_HOME = ENV['XDG_CACHE_HOME'].to_s
CACHE_DIRECTORY = CACHE_HOME.empty? ? File.join(Dir.home, '.cache') : CACHE_HOME

# The marker records when the last run happened, so each run only has to consider the images added
# since. Its file lives outside the screenshots directory, because writing to it there would
# retrigger the launch agent that runs this script. On the first run there's no marker yet.
MARKER_FILE = File.join(CACHE_DIRECTORY, 'stamp-screenshots', 'marker')
MARKER = File.exist?(MARKER_FILE) ? File.mtime(MARKER_FILE) : nil

unless Dir.exist?(SCREENSHOTS_DIRECTORY)
  abort "Error: The directory #{SCREENSHOTS_DIRECTORY} does not exist."
end

# Returns Shottr as a hex-encoded Launch Services handler, the form xattr writes.
def handler
  arguments = ['plutil', '-convert', 'binary1', '-o', '-', HANDLER_PLIST_PATH]
  IO.popen(arguments, 'rb', &:read).unpack1('H*')
end

# Returns the images the run needs to consider. Without a marker that's every image in the
# directory; otherwise it's only the ones added since the last run.
def new_images
  pattern = File.join(SCREENSHOTS_DIRECTORY, "*.{#{EXTENSIONS.join(',')}}")

  Dir.glob(pattern, File::FNM_CASEFOLD)
    .select { File.file?(_1) }
    .select { MARKER.nil? || File.mtime(_1) > MARKER }
end

# Returns whether the image already has a handler, which means one was chosen by hand.
def stamped?(image)
  system('xattr', '-p', ATTRIBUTE, image, out: File::NULL, err: File::NULL)
end

# Stage the next marker before scanning, so an image added mid-run is picked up next time rather
# than skipped.
FileUtils.mkdir_p(File.dirname(MARKER_FILE))
FileUtils.touch("#{MARKER_FILE}.next")

shottr_handler = handler

new_images.each do |image|
  next if stamped?(image)

  system('xattr', '-w', '-x', ATTRIBUTE, shottr_handler, image, exception: true)
end

FileUtils.mv("#{MARKER_FILE}.next", MARKER_FILE)
