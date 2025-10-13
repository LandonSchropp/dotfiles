// NOTE: These use Phoenix's custom require function, not Node.js's require.
require("./configuration.js");
require("./rectangle.js");
require("./layouts.js");
require("./flashspace.js");

// For now, bind the "reset" action to COC + R.
Key.on("r", ["command", "option", "control", "shift"], async () => {
  // Fetch all of the currently visible windows
  //
  // TODO: The call to windows takes 1–3 seconds. (https://github.com/kasper/phoenix/issues/342)
  const screen = Screen.main();
  let windows = screen.windows({ visible: true });

  // Get the current workspace configuration
  const [profile, workspace] = await Promise.all([
    getFlashSpaceProfile(),
    getFlashSpaceWorkspace(),
  ]);

  const configuration = getWorkspaceConfiguration(profile, workspace);

  // Filter out windows that are not part of the current workspace
  windows = windows.filter((window) => configuration.applications.includes(window.app().name()));

  // Reorder the windows based upon the configuration for the current workspace.
  //
  // TODO: The order should also incorporate the _previous_ order of the window IDs to prevent
  // then from rearranging.
  windows = _.sortBy(windows, (window) => {
    // NOTE: Since sortBy performs a stable sort, we don't need to worry about the original order of
    // the windows.
    let index = configuration.applications.indexOf(window.app().name());
    return index === -1 ? windows.length : index;
  });

  // Calculate the window sizes and positions based upon the layout configuration
  let rectangles = CALCULATE_LAYOUTS[configuration.layout](
    screen.flippedVisibleFrame(),
    windows.length,
  );

  // Apply the new sizes and positions to the windows
  for (let i = 0; i < windows.length; i += 1) {
    let window = windows[i];
    let rectangle = rectangles[i];

    window.setFrame(rectangle);
  }
});
