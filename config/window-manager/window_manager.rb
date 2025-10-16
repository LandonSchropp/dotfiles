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
      # TODO: implement
    end
  end
end
