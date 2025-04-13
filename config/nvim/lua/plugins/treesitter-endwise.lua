---@module "lazy"

-- Automatically add the end keyword in Ruby and other similar languages
---@type LazySpec
return {
  { "AstroNvim/astrocommunity" },
  { import = "astrocommunity.editing-support.nvim-treesitter-endwise" },
}
