return {
  ["nvim-treesitter/nvim-treesitter"] = {
    override_options = require("custom.plugins.treesitter")
  },
  ["folke/which-key.nvim"] = {
    disable = false,
    override_options = require("custom.plugins.which_key")
  },
}
