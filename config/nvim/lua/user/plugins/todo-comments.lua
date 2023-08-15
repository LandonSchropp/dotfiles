return {
  "folke/todo-comments.nvim",
  event = "User AstroFile",
  opts = {
    highlight = {
      keyword = "bg",
      after = "",
    },
    keywords = {
      BUGFIX = { icon = " ", color = "warning" },
    },
  },
  keys = {
    { "<leader>ft", "<cmd>TodoTelescope<cr>", desc = "Find todos" },
  },
}
