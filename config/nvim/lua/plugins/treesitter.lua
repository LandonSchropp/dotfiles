---@module "lazy"

-- Install the Ruby treesitter parser.
---@type LazySpec
return {
  "nvim-treesitter/nvim-treesitter",
  opts_extend = { "ensure_installed" },
  opts = {
    ensure_installed = { "ruby" },
  },
}
