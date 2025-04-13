---@module "lazy"

-- Correctly indent lists when editing markdown.
---@type LazySpec
return {
  "gaoDean/autolist.nvim",
  config = function()
    require("autolist").setup({})
  end,
}
