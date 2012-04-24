#!/usr/bin/ruby

# Closes any termianl windows which are already open, opens three terminal windows and arranges 
# them on the screen.

require_relative 'ui/window'

close_all_windows("Terminal")
open_window("Terminal")
fit_window_to_screen_right("Terminal")
open_window("Terminal")
fit_window_to_screen_left("Terminal")