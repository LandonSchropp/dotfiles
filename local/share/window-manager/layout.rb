require_relative 'rectangle'
require_relative 'configuration'

module Layout
  class << self
    def calculate(layout_name, screen_rectangle, number_of_windows)
      case layout_name
      when 'Fullscreen' then fullscreen(screen_rectangle, number_of_windows)
      when 'Columns' then columns(screen_rectangle, number_of_windows)
      when 'Main Stack' then main_stack(screen_rectangle, number_of_windows)
      end
    end

    private

    def fullscreen(screen_rectangle, number_of_windows)
      Array.new(number_of_windows, screen_rectangle)
    end

    def columns(screen_rectangle, number_of_windows)
      return fullscreen(screen_rectangle, number_of_windows) if number_of_windows < 2

      screen_rectangle
        .inset(Configuration.margin)
        .split_into_columns(number_of_windows, Configuration.margin)
    end

    def main_stack(screen_rectangle, number_of_windows)
      return fullscreen(screen_rectangle, number_of_windows) if number_of_windows < 2

      main, secondary = columns(screen_rectangle, 2)
      [main, *secondary.split_into_rows(number_of_windows - 1, Configuration.margin)]
    end
  end
end
