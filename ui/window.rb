

# A collection of functions for manipulating OS X application windows using the rb-appscript gem.

require 'appscript'
require_relative 'keyboard'
require_relative 'menu'
require_relative 'desktop'

# Returns the number of open windows for the provided applicaiton name.
# application_name - The name of the application whose windows should be counted.
def number_of_windows(application_name)
	return Appscript.app.by_name(application_name).windows.count
end

# Returns true if the provided application name has at least one open window and false otherwise.
# application_name The name of the application to check.
def open_window?(application_name)
	Appscript.app.by_name(application_name).windows.first.exists
end

# Closes the active window for the provided application name if it is open.  If the window is not
# open, this handler does nothing.
# application_name - The name of the application whose window should be closed.
def close_window(application_name)

	# make sure a window is open
	return unless open_window?(application_name)

	# close the window
	Appscript.app.by_name(application_name).windows.first.close
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

# Closes all of the windows except the active window for the provided application name.  If the
# application does not have any open windows, this function will open one.
# application_name - The name of the application whose windows should be closed.
def close_all_but_active_window(application_name)
	while (Appscript.app.by_name(application_name).windows[2].exists)
		Appscript.app.by_name(application_name).windows[2].close
	end

	open_window(application_name) unless open_window?(application_name)
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

# Moves the active window for the specified appliation name to the provided coordinates.
# application_name - The name of the application whose window should be moved.
# x - The new x-coordinate of the top left corner of the window.
# y - The new x-coordinate of the top left corner of the window.
def move_window(application_name, x, y)

	# determine the size of the window
	window_bounds = Appscript.app.by_name(application_name).windows.first.bounds.get
	window_width = window_bounds[2] - window_bounds[0]
	window_height = window_bounds[3] - window_bounds[1]

	# move the window
	Appscript.app.by_name(application_name).windows.first.bounds.set([x, y, x + window_width, y + 
		window_height])
end

# Moves and resizes the active window for the provided application name.  If no windows are open
# for the application, this method does nothing.
# application_name - The name of the application whose window will be moves and resized.
# x - The new x-coordinate of the top left corner of the window.
# y - The new x-coordinate of the top left corner of the window.
def move_and_resize_window(application_name, x, y, width, height)

	# make sure a window is open
	return unless open_window?(application_name)

	# move and resize the window
	Appscript.app.by_name(application_name).windows.first.bounds.set([x, y, x + width, y + height])
end

# Moves and resizes the active window of the provided application name to the entire screen, 
# excluding the menu bar area.
# application_name - The name of the application whose window should be centered.
# margin - The margin around the window.
def fit_window_to_screen(application_name, margin = 20)
	bounds = desktop_bounds_excluding_menubar

	# resize the bounds
	bounds[0] += margin
	bounds[1] += margin
	bounds[2] -= margin * 2
	bounds[3] -= margin * 2

	move_and_resize_window(application_name, bounds[0], bounds[1], bounds[2], bounds[3])
end

# Moves and resizes the active window of the provided application name to the left half of the 
# screen, excluding the menu bar area.
# application_name - The name of the application whose window should be centered.
# margin - The margin around the window.
def fit_window_to_screen_left(application_name, margin = 20)
	bounds = desktop_left_bounds_excluding_menubar

	# resize the bounds
	bounds[0] += margin
	bounds[1] += margin
	bounds[2] -= margin * 3 / 2
	bounds[3] -= margin * 2

	move_and_resize_window(application_name, bounds[0], bounds[1], bounds[2], bounds[3])
end

# Moves and resizes the active window of the provided application name to the right half of the 
# screen, excluding the menu bar area.
# application_name - The name of the application whose window should be centered.
# margin - The margin around the window.
def fit_window_to_screen_right(application_name, margin = 20)
	bounds = desktop_right_bounds_excluding_menubar

	# resize the bounds
	bounds[0] += margin * 0.5
	bounds[1] += margin
	bounds[2] -= margin * 3 / 2
	bounds[3] -= margin * 2

	move_and_resize_window(application_name, bounds[0], bounds[1], bounds[2], bounds[3])
end

# Moves and resizes the active window of the provided application name to the top left quadrant of 
# the screen, excluding the menu bar area.
# application_name - The name of the application whose window should be centered.
# margin - The margin around the window.
def fit_window_to_screen_top_left(application_name, margin = 20)
	bounds = desktop_top_left_bounds_excluding_menubar

	# resize the bounds
	bounds[0] += margin
	bounds[1] += margin
	bounds[2] -= margin * 3 / 2
	bounds[3] -= margin * 3 / 2

	move_and_resize_window(application_name, bounds[0], bounds[1], bounds[2], bounds[3])
end

# Moves and resizes the active window of the provided application name to the top right quadrant 
# of the screen, excluding the menu bar area.
# application_name - The name of the application whose window should be centered.
# margin - The margin around the window.
def fit_window_to_screen_top_right(application_name, margin = 20)
	bounds = desktop_top_right_bounds_excluding_menubar

	# resize the bounds
	bounds[0] += margin * 0.5
	bounds[1] += margin
	bounds[2] -= margin * 3 / 2
	bounds[3] -= margin * 3 / 2

	move_and_resize_window(application_name, bounds[0], bounds[1], bounds[2], bounds[3])
end

# Moves and resizes the active window of the provided application name to the bottom left quadrant 
# of the screen, excluding the menu bar area.
# application_name - The name of the application whose window should be centered.
# margin - The margin around the window.
def fit_window_to_screen_bottom_left(application_name, margin = 20)
	bounds = desktop_bottom_left_bounds_excluding_menubar

	# resize the bounds
	bounds[0] += margin
	bounds[1] += margin * 0.5
	bounds[2] -= margin * 3 / 2
	bounds[3] -= margin * 3 / 2

	move_and_resize_window(application_name, bounds[0], bounds[1], bounds[2], bounds[3])
end

# Moves and resizes the active window of the provided application name to the bottom right 
# quadrant of the screen, excluding the menu bar area.
# application_name - The name of the application whose window should be centered.
# margin - The margin around the window.
def fit_window_to_screen_bottom_right(application_name, margin = 20)
	bounds = desktop_bottom_right_bounds_excluding_menubar

	# resize the bounds
	bounds[0] += margin * 0.5
	bounds[1] += margin * 0.5
	bounds[2] -= margin * 3 / 2
	bounds[3] -= margin * 3 / 2

	move_and_resize_window(application_name, bounds[0], bounds[1], bounds[2], bounds[3])
end