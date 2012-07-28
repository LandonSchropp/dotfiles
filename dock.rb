require 'rubygems'
require 'appscript'
require_relative 'application'

# Controls the Dock's user interface.
class Dock

	# Returns true if the dock is visible and false otherwise.
	def visible?
		not hidden?
	end

	# Returns true if the dock is hidden and false otherwise.
	def hidden?
		`defaults read com.apple.Dock autohide`.to_i == 1
	end

	# Returns the height of the dock.
	def height
		return 0 if hidden?

		return Appscript.app.by_name("System Events").processes["Dock"].lists[0].size.get[1]
	end
end