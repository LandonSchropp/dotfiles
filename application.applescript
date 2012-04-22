-- A collection of applescripts which perform functions to an individual applescript.

-- Closes the active window for the provided application name if it is open.  If the window is not
-- open this handler does nothing.
-- applicationName - The name of the application whose window should be closed.
on closeWindow(applicationName)
	tell application applicationName
		if window 1 exists then
			close window 1
		end
	end tell
end closeWindow

-- Closes all of the windows for the provided application name.
-- applicationName - The name of the application whose windows should be closed.
on closeAllWindows(applicationName)
  tell application applicationName to close every window
end closeAllWindows

-- Opens a new window for the provided application name.  This method uses the "New Window" menu 
-- item.  If the menu item is not available, this method falls back on the keyboard shortcut
-- command + N.
on openNewWindow(applicationName)
  try
  	-- attempt to click on the "New Window" menu item.
  	clickMenuItem(applicationName, "File", "New Window")
  on error error_message
  	-- fall back to the command + N keyboard shortcut
    runKeyboardShortcut(applicationName, "n", { command down })
  end try
end openNewWindow

-- Opens the provided number of windows for the provided application name.  This method uses the
-- "New Window" menu item to open windows.  If the menu item is not available, this method falls
-- back on the keyboard shortcut command + N.
-- applicationName - The name of the application whose windows should be opened.
-- numberOfWindows - The number of windows to open.
on openNewWindows(applicationName, numberOfWindows)
	repeat numberOfWindows times
		openNewWindow(applicationName)
	end repeat
end openNewWindows

-- Clicks on the menu item for the provided application name menu bar item and menu item.  If that
-- fails, use the shortcut command + N.
-- applicationName - The name of the application.
-- menuBarItem - The name of the menu bar item which should be clicked (i.e. "File", "Edit", etc.).
-- menuItem - The item in the menu bar to click (i.e. "New Window", "Copy", "Quit", etc.).
on clickMenuItem(applicationName, menuBarItem, menuItem)
	-- This logic was borrowed from: 
	-- http://www.macosxautomation.com/applescript/uiscripting/index.html
	tell application applicationName to activate
	tell application "System Events"
		tell process applicationName
			tell menu bar 1
				tell menu bar item menuBarItem
					tell menu menuBarItem
						click menu item menuItem
					end tell
				end tell
			end tell
		end tell
	end tell
end clickMenuItem

-- Runs the keyboard shortcut for the provided application name.
-- applicationName - The name of the application to run the keyboard shortcut on.
-- key - The key to press.  For example, this could be "n" or "q".
-- modifiersList - A list of modifiers for the keyboard shortcut.  This could be something like
-- { command down } or { command down, shift down, option down }.
on runKeyboardShortcut(applicationName, key, modifiersList)
	tell application applicationName to activate
	tell application "System Events"
	  keystroke key using modifiersList
	end tell
end runKeyboardShortcut

closeWindow("Finder")