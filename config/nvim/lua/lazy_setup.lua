---@module "lazy"

---@type LazySpec
local plugins = {
  {
    "AstroNvim/AstroNvim",
    version = "^5",
    import = "astronvim.plugins",
    opts = {

      -- This ensures the leader key must be configured before Lazy is set up
      mapleader = " ",

      -- This ensures the localleader key must be configured before Lazy is set up
      maplocalleader = ",",

      -- Enable icons
      icons_enabled = true,
    },
  },
  { import = "community" },
  { import = "plugins" },
}

require("lazy").setup(plugins, {})
