This directory contains a lightweight window manager for macOS written in Swift that implements
workspace-aware window layout management.

The window manager uses macOS's Accessibility API to manipulate windows and CGWindowList to detect
visible windows. It's designed to work alongside [FlashSpace](https://github.com/wojciech-kulik/FlashSpace),
providing the window positioning and layout features that FlashSpace doesn't handle.

The core idea is each workspace has an associated layout that determines how windows are arranged.
You invoke the window manager with a profile and workspace name (e.g., `window-manager Split Terminal`),
and it applies that workspace's layout. It provides predefined layouts like `Columns`, `Main Stack`, or
`Fullscreen`.

## Features

- 📐 **Predefined layouts:** Standard layouts like columns, split views and other common
  arrangements that can be applied instantly
- 🎯 **Application filtering:** Define an allowlist of applications to manage; others are ignored
  entirely
- 🔑 **Per-workspace layout management:** Apply different layout rules to different workspaces
- ⚡ **Fast execution:** Compiled Swift binary executes in ~0.5 seconds

### Future Features

These are features I'm considering adding in the future.

- ⌨️ **Window navigation:** Move focus between windows using directional commands (left, right, up,
  down)
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

Configuration is stored in `Sources/configuration.json`:

```json
{
  "margin": 10,
  "workspaces": [
    {
      "profile": "Split",
      "workspace": "Terminal",
      "layout": "Main Stack",
      "applications": ["Arc", "Ghostty"]
    }
  ]
}
```

The configuration contains the following properties:

- `margin`: Spacing in pixels between windows when using tiled layouts
- `workspaces`: Array of workspace configurations
  - `profile`: FlashSpace profile name
  - `workspace`: FlashSpace workspace name
  - `layout`: Layout name (`"Fullscreen"`, `"Columns"`, or `"Main Stack"`)
  - `applications`: Ordered list of application names to manage and their positions in the layout
