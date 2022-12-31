return {
  ["nvim-treesitter/nvim-treesitter"] = {
    override_options = {
      ensure_installed = "all",
    }
  },
  ["folke/which-key.nvim"] = {
    disable = false,
    override_options = {
      plugins = {
        spelling = {
          enabled = true
        },
      },
      window = {
        border = "single",
      },
    },
  },
}
