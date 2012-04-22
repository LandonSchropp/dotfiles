# A collection of functions for manipulating OS X application windows using the rb-appscript gem.

require 'appscript'
require './keyboard'
require './menu'

# Returns the number of open windows for the provided applicaiton name.
# application_name - The name of the application whose windows should be counted.
def number_of_windows(application_name)
	return Appscript.app.by_name(application_name).windows.count
end

# Returns true if the provided application name has at least one open window and false otherwise.
# application_name The name of the application to check.
def open_window?(application_name)
	Appscript.app.by_name(application_name).windows[1].exists
end

# Closes the active window for the provided application name if it is open.  If the window is not
# open, this handler does nothing.
# application_name - The name of the application whose window should be closed.
def close_window(application_name)

	# make sure a window is open
	return unless open_window?(application_name)

	# close the window
	Appscript.app.by_name(application_name).windows[1].close
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
def close_all_windows(application_name)
	Appscript.app.by_name(application_name).windows.close
end

# Opens a new window for the provided application name.  This method uses the "New Window" menu 
# item.  If the menu item is not available, this method falls back on the keyboard shortcut
# command + n.
# application_name - The name of the application for which a window should be opened.
def open_window(application_name)
	begin
		# attempt to clikc on the "New Window" item
		click_menu_item(application_name, "File", "New Window")
	rescue
		# fall back on the command + n keyboard shortcut
		press_key(application_name, "n", [ :command_down ])
	end
end

# Opens the provided number of windows for the provided application name.  This method uses the
# "New Window" menu item to open windows.  If the menu item is not available, this method falls
# back on the keyboard shortcut command + N.
# application_name - The name of the application for which the windows should be opened.
# number_of_windows - The number of windows to open.
def open_windows(application_name, number_of_windows)
	number_of_windows.times do 
		open_window(application_name)
	end
end

# Centers the active window of the provided application name within the bounds provided to this
# function.
# application_name - The name of the application whose window should be centered.
# x The x-coordinate of the bounds in which the window is centerd.
# y The y-coordinate of the bounds in which the window is centerd.
# width The width of the bounds in which the window is centerd.
# height The height of the bounds in which the window is centerd.
def center_window(application_name, x, y, width, height)
	
	# make sure a window is open
	return unless open_window?(application_name)

	# determine the size of the window
	bounds = Appscript.app.by_name(application_name).windows[1].bounds.get
	window_width = bounds[2] - bounds[0]
	window_height = bounds[3] - bounds[1]

	# center the window
	x1 = ((width - window_width) / 2).floor
	y1 = ((height - window_height) / 2).floor
	x2 = x1 + window_width
	y2 = y1 + window_height
	Appscript.app.by_name(application_name).windows[1].bounds.set([x1, y1, x2, y2])
end

# Centers the active window of the provided application name in the screen.
# application_name - The name of the application whose window should be centered.
def center_window_in_screen(application_name)
	
	# make sure a window is open
	return unless open_window?(application_name)

	# screen_size =  to bounds of window of desktop
 #    set screenWidth to item 3 of screenSize
 #    set screenHeight to item 4 of screenSize
end

center_window_in_screen("Finder")