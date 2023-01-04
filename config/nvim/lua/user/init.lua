return {

  -- Configure AstroNvim updates
  updater = {
    channel = "stable",
    version = "v2.*",
  },

  -- Set the color scheme.
  colorscheme = "tokyonight",

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
