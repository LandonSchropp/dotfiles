require_relative 'applescript'

Window = Data.define(:application, :index) do
  class << self
    def visible
      script = <<~APPLESCRIPT
        tell application "System Events"
          set output to ""

          repeat with proc in (every process whose visible is true)
            repeat with index from 1 to (count of windows of proc)
              set output to output & (displayed name of proc) & "|" & index & linefeed
            end repeat
          end repeat

          return output
        end tell
      APPLESCRIPT

      AppleScript.run(script).lines.map(&:strip).reject(&:empty?).map do |line|
        application, index = line.split('|')
        Window.new(application:, index: index.to_i)
      end
    end
  end

  def update_position(rectangle)
    script = <<~APPLESCRIPT
      tell application "System Events"
        tell process "#{application}"
          set position of window #{index} to {#{rectangle.x}, #{rectangle.y}}
          set size of window #{index} to {#{rectangle.width}, #{rectangle.height}}
        end tell
      end tell
    APPLESCRIPT

    AppleScript.run(script)
  end
end
