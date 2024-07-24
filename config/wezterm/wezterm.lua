local wezterm = require("wezterm")

local Multiple = wezterm.action.Multiple
local SendKey = wezterm.action.SendKey

return {
  -- Font
  font = wezterm.font_with_fallback({ "JetBrainsMono Nerd Font", "Apple Color Emoji" }),
  font_size = 19,
  line_height = 1.2,

  -- Colors
  color_scheme = "Tokyo Night Moon",
  term = "wezterm",

  -- Appearance
  enable_tab_bar = false,
  window_padding = { left = 4, right = 4, top = 4, bottom = 4 },
  window_decorations = "TITLE | RESIZE",

  -- TODO: Center window content once [this issue](https://github.com/wez/wezterm/issues/1124) is
  -- closed.

  keys = {
    -- New tab
    {
      key = "t",
      mods = "CMD",
      action = Multiple({ SendKey({ key = "s", mods = "CTRL" }), SendKey({ key = "c" }) }),
    },

    -- Rename tab
    {
      key = "r",
      mods = "CMD",
      action = Multiple({ SendKey({ key = "s", mods = "CTRL" }), SendKey({ key = "r" }) }),
    },

    -- Close tab
    {
      key = "w",
      mods = "CMD",
      action = Multiple({ SendKey({ key = "s", mods = "CTRL" }), SendKey({ key = "x" }) }),
    },

    -- Previous tab
    {
      key = "h",
      mods = "CMD",
      action = Multiple({ SendKey({ key = "s", mods = "CTRL" }), SendKey({ key = "p" }) }),
    },

    -- Next tab
    {
      key = "l",
      mods = "CMD",
      action = Multiple({ SendKey({ key = "s", mods = "CTRL" }), SendKey({ key = "n" }) }),
    },

    -- Scroll
    {
      key = "m",
      mods = "CMD",
      action = Multiple({ SendKey({ key = "s", mods = "CTRL" }), SendKey({ key = "s" }) }),
    },

    -- Rebind the alt + arrow mappings to behave like other macOS apps.
    {
      key = "LeftArrow",
      mods = "OPT",
      action = SendKey({ key = "b", mods = "ALT" }),
    },
    {
      key = "RightArrow",
      mods = "OPT",
      action = SendKey({ key = "f", mods = "ALT" }),
    },

    -- Rebind the command + arrow mappings to behave like other macOS apps.
    {
      key = "LeftArrow",
      mods = "CMD",
      action = SendKey({ key = "a", mods = "CTRL" }),
    },
    {
      key = "RightArrow",
      mods = "CMD",
      action = SendKey({ key = "e", mods = "CTRL" }),
    },
  },
}
