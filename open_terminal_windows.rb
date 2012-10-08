#!/usr/local/bin/macruby

framework "Foundation"
framework "ScriptingBridge"

# a constant representing the height of the menu bar
MENU_BAR_HEIGHT = 22

# Define a constant for not saving the window before closing it
# I figured out how to do this from this mailing list post:
# http://lists.macosforge.org/pipermail/macruby-devel/2009-May/001710.html
# and this copy of the scripting interface: http://goo.gl/U81ih
TerminalSaveOptionsNo = 'no  '.unpack('N').first

# This value was retrieved from: http://goo.gl/nC1hw
SystemEventsEMdsCommandDown = 'Kcmd'.unpack('N').first

# Determines the bounds for the provided region using the main desktop.
# region - An option paramter which determines the region of the screen in which the window
# should be moved and resized.  This parameter may be one of the following values: :top, :bottom,
# :left, :right, :top_left, :top_right, :bottom_left, :bottom_right or nil.  If nil is provdied, the 
# window will be fit to the entire screen.
# margin - The margin around each window.
def bounds_for_region(region = nil, margin = 20)

  # determine the desktop bounds
  desktop_bounds = NSScreen.mainScreen.visibleFrame
  desktop_bounds.origin.y = MENU_BAR_HEIGHT

  x = desktop_bounds.origin.x
  y = desktop_bounds.origin.y
  width = desktop_bounds.size.width
  height = desktop_bounds.size.height

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

  return NSRect.new(NSPoint.new(x, y), NSSize.new(width, height))
end

# determine the nubmer of requested windows
number_of_windows = ARGV.empty? ? 4 : ARGV[0].to_i

# detemine where the windows should be placed
regions = nil

if number_of_windows == 2
  regions = [ :left, :right ]
elsif number_of_windows == 3
  regions = [ :left, :top_right, :bottom_right ]
elsif number_of_windows == 4
  regions = [ :top_left, :top_right, :bottom_left, :bottom_right ]
else
  regions = [ nil ]
end

# get the desktop bounds
desktopBounds = bounds_for_region(nil)

# get the terminal app
terminal = SBApplication.applicationWithBundleIdentifier("com.apple.Terminal")

# close all but one of the open terminal windows
while terminal.windows.count > 1

  # close the window
  terminal.windows[1].closeSaving(TerminalSaveOptionsNo, savingIn: nil)

end

# get the system events application
system_events = SBApplication.applicationWithBundleIdentifier("com.apple.SystemEvents")

# open up the windows
while terminal.windows.count < number_of_windows
  system_events.keystroke("n", using: SystemEventsEMdsCommandDown)
end

# move the windows
number_of_windows.times do |i|

  # set the bounds for each window
  bounds = bounds_for_region(regions[i])
  terminal.windows[i].bounds = bounds
end

# change the directories
terminal.windows.each do |window|
  terminal.doScript("cd #{File.expand_path(File.dirname(__FILE__))}", in: window.tabs.last)
end

# clear the windows
terminal.windows.each do |window|
  terminal.doScript("clear", in: window.tabs.last)
end