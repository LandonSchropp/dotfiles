---@module "lazy"

-- Install the Ruby treesitter parser.
---@type LazySpec
return {
  "AstroNvim/astrocore",
  ---@type AstroCoreOpts
  opts = {
    treesitter = {
      ensure_installed = { "ruby" },
    },
  },
}
