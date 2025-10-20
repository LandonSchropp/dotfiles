require 'json'
require_relative 'rectangle'
require_relative 'configuration'

Display = Data.define(:name, :profile, :rectangle, :menu_bar_height, :dock_height) do
  class << self
    def main
      @main ||= begin
        display_json = `yabai -m query --displays`
        frame = JSON.parse(display_json).first['frame']
        rectangle = Rectangle.from_frame(frame)

        display_config = Configuration.find_display(rectangle.width, rectangle.height)

        Display.new(
          name: display_config.name,
          profile: display_config.profile,
          rectangle: rectangle,
          menu_bar_height: display_config.menu_bar_height,
          dock_height: display_config.dock_height
        )
      end
    end
  end

  def visible_rectangle
    rectangle.inset(menu_bar_height, 0, dock_height)
  end
end
