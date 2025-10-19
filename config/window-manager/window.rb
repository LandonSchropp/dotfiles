require_relative 'rectangle'
require 'json'

Window = Data.define(:application, :id, :rectangle) do
  class << self
    def visible
      json = `yabai -m query --windows`.force_encoding('UTF-8')
      windows = JSON.parse(json)

      windows
        .map do |w|
          rectangle = Rectangle.new(
            x: w['frame']['x'],
            y: w['frame']['y'],
            width: w['frame']['w'],
            height: w['frame']['h']
          )

          Window.new(
            application: w['app'],
            id: w['id'],
            rectangle: rectangle
          )
        end
    end
  end

  def update_position(rectangle)
    `yabai -m window #{id} --move abs:#{rectangle.x}:#{rectangle.y}`
    `yabai -m window #{id} --resize abs:#{rectangle.width}:#{rectangle.height}`
  end
end
