#!/usr/bin/env ruby
# frozen_string_literal: true

require_relative 'window'
require_relative 'display'
require_relative 'configuration'
require_relative 'flashspace'
require_relative 'space'

exit if Space.native_fullscreen?

# Get the focused window and the screen rectangle
window = Window.focused
screen = Display.main.visible_rectangle

# If the window is already fullscreen, restore the workspace layout. Otherwise, expand the window to
# fill the screen.
if window.rectangle == screen
  exec("#{__dir__}/arrange-windows.rb", Flashspace.profile, Flashspace.workspace)
else
  window.update_position(screen)
end
