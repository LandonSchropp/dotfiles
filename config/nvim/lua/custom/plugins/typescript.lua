return {
  after = "nvim-lspconfig",
  config = function()
    require("typescript").setup({})
  end,
}
