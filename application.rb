# A collection of useful functions for manipulating OS X applications using the rb-appscript gem.

require 'appscript'

# Returns the number of open windows for the provided applicaiton name.
# application_name - The name of the application whose windows should be counted.
def number_of_open_windows(application_name)
	return Appscript.app.by_name(application_name).windows.count
end

# Closes the active window for the provided application name if it is open.  If the window is not
# open, this handler does nothing.
# application_name - The name of the application whose window should be closed.
def close_window(application_name)
	application = Appscript.app.by_name(application_name)

	if (application.windows[1].exists)
		application.windows[1].close
	end
end

# Closes the provided number of windows for the indicated application name.  If less windows are
# open than the provided number of windows, this method closes all of the windows.  This method 
# will close windows in their reverse ordering, as determined by the operating system.  For 
# example, the most active window will be closed first, and then the previously active window, and 
# so on.
# application_name - The name of the application whose windows should be closed.
# number_of_windows - The number of windows to be closed.  If this number is greater than the
# number of windows currently open in the application, all of the windows will be closed.
def close_windows(application_name, number_of_windows)
	number_of_windows.timed do
		close_window(application_name)
	end
end

# Closes all of the windows for the provided application name.
# application_name - The name of the application whose windows should be closed.
def close_windows(application_name)
	Appscript.app.by_name(application_name).windows.close
end

# Opens a new window for the provided application name.  This method uses the "New Window" menu 
# item.  If the menu item is not available, this method falls back on the keyboard shortcut
# command + n.
# application_name - The name of the application for which a window should be opened.
def open_new_window(application_name)
	begin
		# attempt to clikc on the "New Window" item
		click_menu_item(application_name, "File", "New Window")
	rescue
		# fall back on the command + N keyboard shortcut
		run_keyboard_shortcut(application_name, "n", [ :command_down ])
	end
end

# Opens the provided number of windows for the provided application name.  This method uses the
# "New Window" menu item to open windows.  If the menu item is not available, this method falls
# back on the keyboard shortcut command + N.
# application_name - The name of the application for which the windows should be opened.
# number_of_windows - The number of windows to open.
def open_new_windows(application_name, number_of_windows)
	number_of_windows.times do 
		open_new_window(application_name)
	end
end

# Clicks on the menu item for the provided application name menu bar item and menu item.  If that
# fails, use the shortcut command + N.
# application_name - The name of the application which should have its menu item clicked.
# menu_name - The name of the menu which should be clicked (i.e. "File", "Edit", etc.).
# menuItem - The item in the menu bar to click (i.e. "New Window", "Copy", "Quit", etc.).
def click_menu_item(application_name, menu_name, menuItem)
	Appscript.app.by_name(application_name).activate
	Appscript.app.by_name("System Events")
		.processes[application_name]
		.menu_bars[1]
		.menu_bar_items[menu_name]
		.menus[menu_name]
		.menu_items[menuItem]
		.click
end

# Runs the keyboard shortcut for the provided application name.
# application_name - The name of the application that should have the keyboard shortcut applied to 
# it.
# key - The key to press.  For example, this could be "n" or "N".  If a capital letter is provided,
# the system will simulate the shift key being pressed down.
# modifiers - An array of modifiers for the keyboard shortcut.  This should be something like
# [ :command_down ] or [ :command_down, :shift_down, :option_down ].
def run_keyboard_shortcut(application_name, key, modifiers)
	Appscript.app.by_name(application_name).activate
	Appscript.app.by_name("System Events").keystroke(key, :using => modifiers)
end