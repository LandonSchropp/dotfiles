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

  -- Add/modify/disable mappings.
  mappings = require("user.mappings"),

  -- Add/modify/disable plugins.
  plugins = require("user.plugins"),

  -- Perform additional config that doens't fit into the other areas.
  polish = function()
    -- HACK: Automatically run checktime whenever the Neovim window gains focus. This should make the
    -- autoread behavior work as expected. (https://github.com/neovim/neovim/issues/1380)
    vim.api.nvim_create_autocmd("FocusGained", {
      pattern = "*",
      callback = function()
        vim.api.nvim_command("checktime")
      end,
    })

    -- Include the remaining configuration.
    require("user.settings")
    require("user.commands")
  end,
}
