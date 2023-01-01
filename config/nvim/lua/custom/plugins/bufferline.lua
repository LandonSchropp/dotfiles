return {
  tag = "v3.*",
  requires = "nvim-tree/nvim-web-devicons",
  after = "nvim-web-devicons",
  config = function()
    require("bufferline").setup({})
  end,
}
