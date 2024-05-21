return {
  "stevearc/oil.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require("oil").setup()
  end,
  keys = {
    {
      "<Leader>Fo",
      function()
        require("oil").open()
      end,
      desc = "Oil",
    },
  },
}
