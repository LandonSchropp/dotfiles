return {
  "akinsho/git-conflict.nvim",
  version = "*",
  config = function()
    require("git-conflict").setup({
      default_mappings = {
        ours = "go",
        theirs = "gt",
        none = "g0",
        both = "gb",
      },
    })
  end,
  keys = {
    { "<leader>gq", "<cmd>GitConflictListQf<cr>", desc = "Git conflict list" },
  },
}
