# A collection of functions for manipulating the Terminal application using the rb-appscript gem.

require 'appscript'
require_relative '../ui/menu'
require_relative '../ui/window'

# Runs the provided command for the active Terminal window.  If no window is open, this function
# does nothing.  This function returns the value of the executed command.

# TODO: find out why this method opens a new terminal window and stop it
def run_terminal_command(command)
	return unless open_window?("Terminal")

	# run the command for the active window
	terminal = Appscript.app.by_name("Terminal").windows.first.do_script(command)
end

# Clears the Terminal screen for the currently active Terminal application.
def clear_terminal_screen
	return unless open_window?("Terminal")

	click_menu_item("Terminal", "View", "Clear Scrollback")
end