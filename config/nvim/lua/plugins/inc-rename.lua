return {
  "smjonas/inc-rename.nvim",
  config = function()
    require("inc_rename").setup({
      preview_empty_name = true,
    })
  end,
}
