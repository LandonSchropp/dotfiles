# A collection of functions for manipulating OS X Desktop using the rb-appscript gem.

require 'appscript'

# A constant which indicates the height of the menu bar
MENU_BAR_HEIGHT = 22

# Returns the bounds of the Desktop without subtacting the size of the menu bar.  The bounds are
# returned in the format [x, y, width, height].
def desktop_bounds
	bounds = Appscript.app.by_name("Finder").desktop.window.bounds.get
	bounds[2] = bounds[2] - bounds[0]
	bounds[3] = bounds[3] - bounds[1]
	return bounds
end

# Returns the bounds of the Desktop subtacting the area of the the menu bar.  The bounds are
# returned in the format [x, y, width, height].
def desktop_bounds_excluding_menubar
	bounds = desktop_bounds
	bounds[1] = bounds[1] + MENU_BAR_HEIGHT
	bounds[3] = bounds[3] - MENU_BAR_HEIGHT
	return bounds
end

# Returns the bounds of the left half of the desktop subtracting the area of the menu bar.  The 
# bounds are returned in the format [x, y, width, height].
def desktop_left_bounds_excluding_menubar
	bounds = desktop_bounds_excluding_menubar
	bounds[2] /= 2
	return bounds
end

# Returns the bounds of the right half of the desktop subtracting the area of the menu bar.  The 
# bounds are returned in the format [x, y, width, height].
def desktop_right_bounds_excluding_menubar
	bounds = desktop_bounds_excluding_menubar
	bounds[2] /= 2
	bounds[0] += bounds[2]
	return bounds
end

# Returns the bounds of the top left quadrant of the desktop subtracting the area of the menu bar.
# The bounds are returned in the format [x, y, width, height].
def desktop_top_left_bounds_excluding_menubar
	bounds = desktop_bounds_excluding_menubar
	bounds[2] /= 2
	bounds[3] /= 2
	return bounds
end

# Returns the bounds of the top right quadrant of the desktop subtracting the area of the menu bar.
# The bounds are returned in the format [x, y, width, height].
def desktop_top_right_bounds_excluding_menubar
	bounds = desktop_bounds_excluding_menubar
	bounds[2] /= 2
	bounds[0] += bounds[2]
	bounds[3] /= 2
	return bounds
end

# Returns the bounds of the bottom left quadrant of the desktop subtracting the area of the menu 
# bar.  The bounds are returned in the format [x, y, width, height].
def desktop_bottom_left_bounds_excluding_menubar
	bounds = desktop_bounds_excluding_menubar
	bounds[2] /= 2
	bounds[3] /= 2
	bounds[1] += bounds[3]
	return bounds
end

# Returns the bounds of the bottom right quadrant of the desktop subtracting the area of the menu 
# bar.  The bounds are returned in the format [x, y, width, height].
def desktop_bottom_right_bounds_excluding_menubar
	bounds = desktop_bounds_excluding_menubar
	bounds[2] /= 2
	bounds[0] += bounds[2]
	bounds[3] /= 2
	bounds[1] += bounds[3]
	return bounds
end