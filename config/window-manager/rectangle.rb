Rectangle = Data.define(:x, :y, :width, :height) do

  def inset(inset)
    Rectangle.new(
      x: x + inset,
      y: y + inset,
      width: width - inset * 2,
      height: height - inset * 2
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
