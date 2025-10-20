require 'json'
require_relative 'rectangle'
require_relative 'configuration'

Display = Data.define(:rectangle, :menu_bar_height, :dock_height) do
  class << self
    def main
      @main ||= begin
        display_json = `yabai -m query --displays`
        frame = JSON.parse(display_json).first['frame']

        Display.new(
          rectangle: Rectangle.from_frame(frame),
          menu_bar_height: Configuration.menu_bar_height,
          dock_height: Configuration.dock_height
        )
      end
    end
  end

  def visible_rectangle
    rectangle.inset(menu_bar_height, 0, dock_height)
  end

  def built_in_display?
    rectangle.width <= Configuration.full_display_width
  end
end
