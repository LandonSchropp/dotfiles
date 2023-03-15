return {
  "Wansmer/treesj",
  keys = {
    {
      "gj",
      function()
        require("treesj").join()
      end,
      desc = "Join",
    },
    {
      "gJ",
      function()
        require("treesj").join({ join = { recursive = true } })
      end,
      desc = "Join recursively",
    },
    {
      "gs",
      function()
        require("treesj").split()
      end,
      desc = "Split",
    },
    {
      "gS",
      function()
        require("treesj").split({ split = { recursive = true } })
      end,
      desc = "Split recursively",
    },
  },
  dependencies = { "nvim-treesitter/nvim-treesitter" },
  config = function()
    require("treesj").setup({
      use_default_keymaps = false,
      check_syntax_error = false,
      max_join_length = 100,
    })
  end,
}
