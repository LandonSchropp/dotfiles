require_relative 'applescript'
require_relative 'rectangle'

class Screen
  class << self
    def visible_rectangle
      script = <<~APPLESCRIPT
        use framework "Foundation"
        use framework "AppKit"

        set mainScreen to current application's NSScreen's mainScreen()
        set screenFrame to mainScreen's frame()
        set visibleFrame to mainScreen's visibleFrame()

        return {screenFrame, visibleFrame}
      APPLESCRIPT

      result = AppleScript.run(script).strip
      values = result.split(', ').map(&:to_f)

      # First 4 values are screen frame: x, y, width, height
      screen_height = values[3]

      # Next 4 values are visible frame: x, y, width, height (bottom-left origin)
      visible_x = values[4]
      visible_y = values[5]
      visible_width = values[6]
      visible_height = values[7]

      # Convert from bottom-left (Cocoa) to top-left (Accessibility) coordinates
      y_top = screen_height - (visible_y + visible_height)

      Rectangle.new(x: visible_x.to_i, y: y_top.to_i, width: visible_width.to_i, height: visible_height.to_i)
    end
  end
end
