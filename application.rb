require 'rubygems'
require 'appscript'
require_relative 'dock'

# Allows control of an application's user interface.
class Application

	# The name of the application.
	attr_reader :name

	# Define the menu bar height
	# CAUTION: This could break in a future implementation of OS X.
	MENU_BAR_HEIGHT = 22

	# Initializes a new instance of Application.
	# name - The name of the application.
	def initialize(name)
		@name = name
		@dock = Dock.new
	end

	# Returns the number of open windows.
	def number_of_windows
		return Appscript.app.by_name(@name).windows.count
	end

	# Returns true if at least one window is open.
	def open_window?
		return Appscript.app.by_name(@name).windows.first.exists
	end

	# Closes the active window.  If no windows are open, this method does nothing.
	def close_window

		# make sure a window is open
		return unless open_window?

		# close the window
		return Appscript.app.by_name(@name).windows.first.close
	end

	# Closes all of the windows.
	def close_windows
		Appscript.app.by_name(@name).windows.close
	end

	# Closes all of the application's windows except the current one.  If no windows are open, this 
	# method does nothing.
	def close_background_windows
		Appscript.app(@name).windows[2].close while number_of_windows > 1
	end

	# Opens a new window.  This method uses the "New Window" menu item.  If the menu item is not 
	# available, this method falls back to the command + N keyboard shortcut.
	def new_window
		begin
			# attempt to clikc on the "New Window" item
			self.click_menu_item("File", "New Window")
		rescue
			# fall back on the command + n keyboard shortcut
			self.press_key("n", [ :command_down ])
		end
	end

	# Clicks on the provided menu item.
	# menu_name - The name of the menu which should be clicked (i.e. "File", "Edit", etc.).
	# menu_item - The item in the menu bar to click (i.e. "New Window", "Copy", "Quit", etc.).
	def click_menu_item(menu_name, menu_item)
		Appscript.app.by_name(@name).activate
		Appscript.app.by_name("System Events")
			.processes[@name]
			.menu_bars[1]
			.menu_bar_items[menu_name]
			.menus[menu_name]
			.menu_items[menu_item]
			.click
	end

	# Triggers a keyboard event.
	# key - The key to press.  For example, this could be "n" or "N".  The case of the letter is
	# ignored.
	# modifiers - Either a symbol or an array of symbols representing the modifier keys. For example:
	# :command_down or [ :command_down, :shift_down, :option_down ].
	def press_key(key, modifiers)
		modifiers = [ modifiers ] if modifiers.is_a? Symbol
		Appscript.app.by_name(@name).activate
		Appscript.app.by_name("System Events").keystroke(key.downcase, :using => modifiers)
	end

	# Moves the active window to the provided coordinates.
	# x - The new x-coordinate of the top left corner of the window.
	# y - The new y-coordinate of the top left corner of the window.
	def move_window(x, y)

		# determine the size of the window
		window_bounds = Appscript.app.by_name(@name).windows.first.bounds.get
		window_width = window_bounds[2] - window_bounds[0]
		window_height = window_bounds[3] - window_bounds[1]

		# move the window
		Appscript.app.by_name(@name).windows.first.bounds.set([x, y, x + window_width, y + 
			window_height])
	end

	# Resizes the active window to the specified dimensions.
	# width - The new width of the window.
	# height - The new height of the window.
	def resize_window(width, height) 

		# determine the size of the window
		window_bounds = Appscript.app.by_name(@name).windows.first.bounds.get
		window_x = window_bounds[0]
		window_y = window_bounds[1]

		# move the window
		Appscript.app.by_name(@name).windows.first.bounds.set([window_x, window_y, window_x + width, 
			window_y + height])
	end

	# Resizes the window to fit the screen, minus the dock and the menu bar.
	# region - An option paramter which determines the region of the screen in which the window
	# should be moved and resized.  This parameter may be one of the following values: :top, :bottom,
	# :left, :right, :top_left, :top_right, :bottom_left, :bottom_right or nil.  If nil is provdied,
	# the window will be fit to the entire screen.
	# margin - The margin around each window.
	def move_and_resize_window_to_screen(region = nil, margin = 20)

		# get the desktop bounds
		desktop_bounds = Appscript.app.by_name("Finder").desktop.window.bounds.get
		x = desktop_bounds[0]
		y = desktop_bounds[1] + MENU_BAR_HEIGHT
		width = desktop_bounds[2] - desktop_bounds[0]
		height = desktop_bounds[3] - desktop_bounds[1] - MENU_BAR_HEIGHT - dock_height

		# alter the x-coordinate based upon the region
		if region == :right or region == :top_right or region == :bottom_right
			x += width / 2
			x += margin / 2
		else
			x += margin
		end

		# alter the y-coordinate based upon the region
		if region == :bottom or region == :bottom_left or region == :bottom_right
			y += height / 2
			y += margin / 2
		else
			y += margin
		end

		# alter the width of the window
		if region == :top_left or region == :top_right or region == :bottom_left or region == 
			:bottom_right or region == :left or region == :right

			width /= 2
			width -= margin * 3 / 2
		else
			width -= margin * 2
		end

		# alter the height of the window
		if region == :top_left or region == :top_right or region == :bottom_left or region == 
			:bottom_right or region == :top or region == :bottom

			height /= 2
			height -= margin * 3 / 2
		else
			height -= margin * 2
		end

		# move and resize the window
		move_window(x, y)
		resize_window(width, height)
	end
end