require_relative 'rectangle'
require_relative 'configuration'
require 'json'

class Screen
  class << self
    def visible_rectangle
      # Get display info from yabai
      display_json = `yabai -m query --displays`
      frame = JSON.parse(display_json).first['frame']

      # Calculate usable screen area excluding menu bar and dock
      Rectangle.new(
        x: frame['x'].to_i,
        y: frame['y'].to_i + Configuration.menu_bar_height,
        width: frame['w'].to_i,
        height: frame['h'].to_i - Configuration.menu_bar_height - Configuration.dock_height
      )
    end
  end
end
