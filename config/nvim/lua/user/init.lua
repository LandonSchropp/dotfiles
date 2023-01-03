return {

  -- Configure AstroNvim updates
  updater = {
    channel = "stable", -- "stable" or "nightly"
    version = "v2.*", -- "latest", tag name, or regex search like "v1.*" to only do updates before v2 (STABLE ONLY)
  },

  -- Set colorscheme to use
  colorscheme = "default_theme",

  -- Modify the dashboard header
  header = require("user.header"),
}
