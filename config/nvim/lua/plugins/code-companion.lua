return {
  "olimorris/codecompanion.nvim",
  config = true,
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
  },
  keys = {
    { "<Leader>t", desc = " Test" },
    { "<leader>aa", "<cmd>CodeCompanionActions<cr>", desc = "Action palette" },
    { "<leader>ac", "<cmd>CodeCompanionChat<cr>", desc = "Chat" },
  },
}
