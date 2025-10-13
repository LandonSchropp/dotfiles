function calculateFullscreenLayout(screenRectangle, numberOfWindows) {
  return _.times(numberOfWindows, () => screenRectangle);
}

function calculateColumnsLayout(screenRectangle, numberOfWindows) {
  if (numberOfWindows < 2) {
    return calculateFullscreenLayout(screenRectangle, numberOfWindows);
  }

  return splitRectangleIntoColumns(insetRectangle(screenRectangle, MARGIN), numberOfWindows, MARGIN);
}

function calculateMainStackLayout(screenRectangle, numberOfWindows) {
  if (numberOfWindows < 2) {
    return calculateFullscreenLayout(screenRectangle, numberOfWindows);
  }

  const [main, secondary] = calculateColumnsLayout(screenRectangle, 2);
  return [main, ...splitRectangleIntoRows(secondary, numberOfWindows - 1, MARGIN)];
}

const CALCULATE_LAYOUTS = {
  Fullscreen: calculateFullscreenLayout,
  Columns: calculateColumnsLayout,
  "Main Stack": calculateMainStackLayout,
};
