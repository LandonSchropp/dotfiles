require_relative 'rectangle'
require_relative 'configuration'
require 'json'

class Screen
  class << self
    def rectangle
      display_json = `yabai -m query --displays`
      frame = JSON.parse(display_json).first['frame']

      Rectangle.new(x: frame['x'], y: frame['y'], width: frame['w'], height: frame['h'])
    end

    def visible_rectangle
      rectangle.inset(Configuration.menu_bar_height, 0, Configuration.dock_height)
    end

    def built_in_display?
      rectangle.width <= Configuration.full_display_width
    end
  end
end
