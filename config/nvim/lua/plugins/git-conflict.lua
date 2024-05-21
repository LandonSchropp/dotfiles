return {
  "akinsho/git-conflict.nvim",
  version = "*",
  opts = {
    default_mappings = {
      ours = "go",
      theirs = "gt",
      none = "g0",
      both = "gb",
    },
  },
  keys = {
    { "<Leader>gq", "<cmd>GitConflictListQf<cr>", desc = "Git conflict list" },
  },
}
