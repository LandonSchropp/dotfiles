require_relative 'applescript'

module WindowManager
  class << self
    def visible_windows
      script = <<~APPLESCRIPT
        tell application "System Events"
          set output to ""

          repeat with proc in (every process whose visible is true)
            repeat with index from 1 to (count of windows of proc)
              set output to output & (name of proc) & "|" & index & linefeed
            end repeat
          end repeat

          return output
        end tell
      APPLESCRIPT

      AppleScript.run(script).lines.map(&:strip).reject(&:empty?).map do |line|
        application, index = line.split('|')
        { application:, index: index.to_i }
      end
    end

    def position_window(window, rectangle)
      script = <<~APPLESCRIPT
        tell application "System Events"
          tell process "#{window[:application]}"
            set position of window #{window[:index]} to {#{rectangle.x}, #{rectangle.y}}
            set size of window #{window[:index]} to {#{rectangle.width}, #{rectangle.height}}
          end tell
        end tell
      APPLESCRIPT

      AppleScript.run(script)
    end
  end
end
