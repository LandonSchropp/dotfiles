require 'rubygems'
require 'appscript'
require_relative 'application'

# Controls the Terminal applicaiton's user interface.
class Terminal < Application

	# Initializes a new instance of Terminal.	
	def initialize
		super("Terminal")
	end

	# Runs a command in the active window.  If no windows are active, this method does nothing.
	# command - The command to run.
	def run(command)
		
		# make sure a window is open
		return unless open_window?

		# run the command
		# the method for running the command in the current window was taken from: 
		# http://superuser.com/a/175032
		current_window = Appscript.app.by_name(self.name).windows.first
		current_window.do_script(command, :in => current_window.tabs.last)
	end

	# Clears the active terminal screen.
	def clear

		# make sure a window is open
		return unless open_window?

		# clear the screen
		run("clear")
	end
end