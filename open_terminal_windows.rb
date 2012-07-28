# Opens the provided number of Terminal windows and arranges them on the screen.  If any windows 
# are open before this script is run, they will be closed.  Each open window will have its 
# directory changed to the current directory.
#
# NOTE: This script closes all of the terminal windows, which is problematic when running this
# script from a terminal window.  To solve this problem, run this script in the following way:
#
# screen ruby open_terminal_windows.rb 4 &

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
terminal.close_windows

# create the new windows and change them to the current directory
regions.each do |region|
	terminal.new_window
	terminal.move_and_resize_window_to_screen region
	terminal.run("cd #{Dir.pwd}")
	terminal.clear
end