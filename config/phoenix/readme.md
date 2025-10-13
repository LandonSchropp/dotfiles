This directory contains my [Phoenix](https://kasper.github.io/phoenix/) configuration that
implements workspace-aware window layout management for macOS.

Phoenix is a lightweight, scriptable window manager that runs as a background daemon. This
configuration extends Phoenix with layout management designed to work alongside
[FlashSpace](https://github.com/wojciech-kulik/FlashSpace), providing the window positioning and
layout features that FlashSpace doesn't handle.

The core idea is each workspace has an associated layout that determines how windows are arranged.
When you switch workspaces, the configuration automatically detects the change and applies that
workspace's layout. It provides predefined layouts like `Columns`, `Main Stack`, or `Fullscreen`.

## Features

- 📐 **Predefined layouts:** Standard layouts like columns, split views and other common
  arrangements that can be applied instantly
- 🎯 **Application filtering:** Define an allowlist of applications to manage; others are ignored
  entirely
- 🔑 **Per-workspace layout management:** Apply different layout rules to different workspaces, with
  windows automatically arranged when you switch
- ⌨️ **Window navigation:** Move focus between windows using directional commands (left, right, up,
  down)
- 🔄 **Layout reapplication:** Reapply the workspace's layout rule, resetting windows to their
  default positions

### Future Features

These are features I'm considering adding in the future assuming there's interest.

- 📏 **Size-based window filtering:** Automatically ignore small windows (utility panels, dialogs)
  that shouldn't be tiled
- 💾 **Interactive window resizing:** Resize windows manually with adjacent windows automatically
  adjusting to maintain the layout
- ⚙️ **Automatic layout adjustment:** Layouts automatically recalculate when windows are added or
  removed
- 🖱️ **Drag to rearrange:** Drag windows to swap positions within the layout

## Layouts

Window Management ships with three predefined layouts:

- **Columns:** Divides screen space equally based on the number of windows. Three windows create
  three equal columns, four windows create four columns, and so on.
- **Main Stack:** The leftmost (main) window takes half the screen width, while remaining windows
  are stacked vertically on the right side, dividing the remaining space equally.
- **Fullscreen:** All windows are set to fullscreen and stacked on top of each other. Use standard
  app switching to move between them. This layout is useful for temporarily hiding window management
  to focus on a single window, then restoring your previous layout when done.

## Configuration

Configuration is stored in `configuration.js` in the same directory as the Phoenix configuration:

- `workspaces`: Array of workspace configurations. Each workspace matches against FlashSpace's
  workspace and profile combination
  - `workspace`: FlashSpace workspace name
  - `profile`: FlashSpace profile name
  - `layout`: Layout name to use for this workspace
  - `applications`: Ordered list of application names. Determines both which apps are managed and
    their position in the layout. Additional applications not in this list will be placed at the
    end.
