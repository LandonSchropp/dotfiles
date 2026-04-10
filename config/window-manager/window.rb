require_relative 'rectangle'
require 'json'

Window = Data.define(:application, :id, :rectangle) do
  class << self
    def visible
      json = `yabai -m query --windows`.force_encoding('UTF-8')
      windows = JSON.parse(json)

      windows
        .select { _1['is-visible'] && !_1['is-minimized'] && !_1['is-floating'] }
        .map { from_yabai_window(_1) }
    end

    def non_visible
      json = `yabai -m query --windows`.force_encoding('UTF-8')
      windows = JSON.parse(json)

      windows
        .reject { _1['is-visible'] }
        .map { from_yabai_window(_1) }
    end

    def focused
      json = `yabai -m query --windows --window`.force_encoding('UTF-8')
      from_yabai_window(JSON.parse(json))
    end

    private

    def from_yabai_window(window)
      Window.new(
        application: window['app'],
        id: window['id'],
        rectangle: Rectangle.from_frame(window['frame'])
      )
    end
  end

  def focus
    `yabai -m window #{id} --focus`
  end

  def update_position(rectangle)
    return if self.rectangle == rectangle

    `yabai -m window #{id} --move abs:#{rectangle.x}:#{rectangle.y}`
    `yabai -m window #{id} --resize abs:#{rectangle.width}:#{rectangle.height}`
  end
end
