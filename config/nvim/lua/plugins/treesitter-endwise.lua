-- Automatically add the end keyword in Ruby and other similar languages
return {
  "RRethy/nvim-treesitter-endwise",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
  },
  config = function()
    require("nvim-treesitter.configs").setup({ endwise = { enable = true } })
  end,
}
