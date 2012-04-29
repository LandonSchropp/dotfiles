# This script first closes all of the open terminal windows except for the currently open one.  It
# opens the provided number of windows and arranges them around the screen.  Finally, it sets the
# current directory of each window to the current directory of the first one.

require 'appscript'
require_relative 'ui/window'
require_relative 'application/terminal'

# determine the nubmer of requested windows
number_of_windows = ARGV.empty? ? 4 : ARGV[0].to_i

# set up the current window
close_all_but_active_window("Terminal")

if (number_of_windows == 4)
	fit_window_to_screen_top_left("Terminal")
else
	fit_window_to_screen_left("Terminal")
end

# TODO: replace this with determining the current directory from the front Terminal window
current_directory = Dir.pwd

# exit if no more windows are required
exit(true) if number_of_windows < 2

# place the second window
# TODO: uncomment this
# open_window("Terminal")
run_terminal_command("cd #{current_directory}")

if number_of_windows == 2
	fit_window_to_screen_right("Terminal")
else
	fit_window_to_screen_top_right("Terminal")
end

# exit if no more windows are required
exit(true) if number_of_windows < 3

# place the third window
# TODO: uncomment this
# open_window("Terminal")
run_terminal_command("cd #{current_directory}")

if number_of_windows == 3
	fit_window_to_screen_bottom_right("Terminal")
else
	fit_window_to_screen_bottom_left("Terminal")
end

# exit if no more windows are required
exit(true) if number_of_windows < 4

# place the fourth window
# TODO: uncomment this
# open_window("Terminal")
run_terminal_command("cd #{current_directory}")
fit_window_to_screen_bottom_right("Terminal")