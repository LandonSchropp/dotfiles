function insetRectangle(rectangle, inset) {
  return {
    x: rectangle.x + inset,
    y: rectangle.y + inset,
    width: rectangle.width - inset * 2,
    height: rectangle.height - inset * 2,
  };
}

function transposeRectangle(rectangle) {
  return {
    x: rectangle.y,
    y: rectangle.x,
    width: rectangle.height,
    height: rectangle.width,
  };
}

function splitRectangleIntoColumns(rectangle, numberOfColumns, gap = 0) {
  return _.times(numberOfColumns, (n) => {
    const columnWidth = (rectangle.width - gap * (numberOfColumns - 1)) / numberOfColumns;

    return {
      x: rectangle.x + n * (columnWidth + gap),
      y: rectangle.y,
      width: columnWidth,
      height: rectangle.height,
    };
  });
}

function splitRectangleIntoRows(rectangle, numberOfRows, gap = 0) {
  return splitRectangleIntoColumns(transposeRectangle(rectangle), numberOfRows, gap).map(
    transposeRectangle,
  );
}
