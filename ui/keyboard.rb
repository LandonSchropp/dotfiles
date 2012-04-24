# A collection of functions for manipulating OS X application keyboard events using the 
# rb-appscript gem.

require 'rubygems'
require 'appscript'

# Triggers the keyboard event for the provided application name.
# application_name - The name of the application that should have the keyboard shortcut applied to 
# it.
# key - The key to press.  For example, this could be "n" or "N".  If a capital letter is provided,
# this function will simulate the shift key being pressed down.
# modifiers - An array of modifiers for the keyboard shortcut.  This should be something like
# [ :command_down ] or [ :command_down, :shift_down, :option_down ].
def press_key(application_name, key, modifiers)
	Appscript.app.by_name(application_name).activate
	Appscript.app.by_name("System Events").keystroke(key, :using => modifiers)
end