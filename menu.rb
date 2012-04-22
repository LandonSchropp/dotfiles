# A collection of functions for manipulating OS X application menu events using the rb-appscript 
# gem.

require 'appscript'

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