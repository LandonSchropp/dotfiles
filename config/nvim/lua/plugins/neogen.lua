return {
  "danymat/neogen",
  dependencies = "nvim-treesitter/nvim-treesitter",
  config = function()
    require("neogen").setup({ snippet_engine = "luasnip" })
  end,
  version = "*",
  keys = {
    {
      "<leader>ld",
      function()
        require("neogen").generate()
      end,
    },
  },
}
