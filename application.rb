require 'appscript'

# Closes the active window for the provided application name if it is open.  If the window is not
# open this handler does nothing.
# applicationName - The name of the application whose window should be closed.
def closeWindow(applicationName)
	application = Appscript.app.by_name(applicationName)

	if (application.windows[1].exists)
		application.windows[1].close
	end
end

# Closes all of the windows for the provided application name.
# applicationName - The name of the application whose windows should be closed.
def closeWindows(applicationName)
	Appscript.app.by_name(applicationName).windows.close
end

# Opens a new window for the provided application name.  This method uses the "New Window" menu 
# item.  If the menu item is not available, this method falls back on the keyboard shortcut
# command + N.
# applicationName - The name of the application for which a window should be opened.
def openNewWindow(applicationName)

end

# Opens the provided number of windows for the provided application name.  This method uses the
# "New Window" menu item to open windows.  If the menu item is not available, this method falls
# back on the keyboard shortcut command + N.
# applicationName - The name of the application for which the windows should be opened.
# numberOfWindows - The number of windows to open.
def openNewWindows(applicationName)

end

# Clicks on the menu item for the provided application name menu bar item and menu item.  If that
# fails, use the shortcut command + N.
# applicationName - The name of the application which should have its menu item clicked.
# menuBarItem - The name of the menu bar item which should be clicked (i.e. "File", "Edit", etc.).
# menuItem - The item in the menu bar to click (i.e. "New Window", "Copy", "Quit", etc.).
def clickMenuItem(applicationName, menuBarItem, menuItem)

end

# Runs the keyboard shortcut for the provided application name.
# applicationName - The name of the application that should have the keyboard shortcut applied to 
# it.
# key - The key to press.  For example, this could be "n" or "q".
# modifiersList - A list of modifiers for the keyboard shortcut.  This could be something like
# { command down } or { command down, shift down, option down }.
def runKeyboardShortcut(applicationName, key, modifiersList)

end