-- Correctly indent lists when editing markdown.
return {
  "gaoDean/autolist.nvim",
  config = function()
    require("autolist").setup({})
  end,
}
