require_relative 'screen'

# This script is called by yabai signals when the active display changes.
#
# Configure in .yabairc:
#
#   yabai -m signal --add event=display_changed action="ruby ~/.dotfiles/config/window-manager/profile_switcher.rb"
#
# Also call this script once on yabai startup to set the initial profile.

profile = Screen.built_in_display? ? 'Full' : 'Split'
system('/usr/local/bin/flashspace', 'profile', profile)
