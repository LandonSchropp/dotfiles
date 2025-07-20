return {
  "nvim-focus/focus.nvim",
  name = "focus",
  version = "*",
  config = function()
    require("focus").setup({
      autoresize = {
        width = 110,
      },
    })
  end,
}
