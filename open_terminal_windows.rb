# Opens the provided number of Terminal windows and arranges them on the screen.  Each open window 
# will have its directory changed to the current directory.

require 'rubygems'
require_relative 'terminal'

# determine the nubmer of requested windows
number_of_windows = ARGV.empty? ? 4 : ARGV[0].to_i

# an array of the regions in which each window is placed
regions = [ ]

if number_of_windows == 2
  regions = [ :left, :right ]
elsif number_of_windows == 3
  regions = [ :left, :top_right, :bottom_right ]
elsif number_of_windows == 4
  regions = [ :top_left, :top_right, :bottom_left, :bottom_right ]
else
  regions = [ nil ]
end

# close all of the windows
terminal = Terminal.new
terminal.close_background_windows

# create the new windows and change them to the current directory
regions.each do |region|
  terminal.new_window
  terminal.move_and_resize_window_to_screen region
  terminal.cd(Dir.pwd)
  terminal.clear
end
