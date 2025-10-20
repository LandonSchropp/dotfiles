Rectangle = Data.define(:x, :y, :width, :height) do
  def self.from_frame(frame)
    Rectangle.new(x: frame['x'], y: frame['y'], width: frame['w'], height: frame['h'])
  end

  # Returns a new Rectangle inset by the specified amount. This function follows the same parameter
  # patterns as CSS's padding shorthand, anthough it only implements a subset of the available CSS
  # options.
  #
  # @example
  #   rectangle.inset(10)             # all sides: 10
  #   rectangle.inset(10, 20, 30)     # top: 10, horizontal: 20, bottom: 30
  def inset(*insets)
    top, right, bottom, left = case insets
    in [all] then [all, all, all, all]
    in [top, horizontal, bottom] then [top, horizontal, bottom, horizontal]
    else raise ArgumentError, "Invalid number of arguments (expected 1 or 3, got #{insets.length})"
    end

    Rectangle.new(
      x: x + left,
      y: y + top,
      width: width - left - right,
      height: height - top - bottom
    )
  end

  def transpose
    Rectangle.new(
      x: y,
      y: x,
      width: height,
      height: width
    )
  end

  def split_into_columns(number_of_columns, gap)
    column_width = (width - gap * (number_of_columns - 1)) / number_of_columns.to_f

    number_of_columns.times.map do |n|
      Rectangle.new(
        x: x + n * (column_width + gap),
        y: y,
        width: column_width,
        height: height
      )
    end
  end

  def split_into_rows(number_of_rows, gap)
    transpose.split_into_columns(number_of_rows, gap).map(&:transpose)
  end
end
