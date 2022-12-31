return {

  -------------
  -- General --
  -------------

  -- Modern syntax parsing and highlighting
  ["nvim-treesitter/nvim-treesitter"] = require("custom.plugins.treesitter"),

  -- Displays a pop up showing key bindings.
  ["folke/which-key.nvim"] = require("custom.plugins.which_key"),

  -- Quickly run Unix commands.
  ["tpope/vim-eunuch"] = {},

  -- Automatically create any non-existent directories before writing the buffer
  ["pbrisbin/vim-mkdir"] = {},

  -- Extra commands for surrounding text
  ["kylechui/nvim-surround"] = {},

  -- Find and replace.
  ["windwp/nvim-spectre"] = {},

  -- Quickly jump to words on the screen.
  ["phaazon/hop.nvim"] = require("custom.plugins.hop"),

  -- Always remember the last place when editing a file.
  ["ethanholz/nvim-lastplace"] = require("custom.plugins.lastplace"),

  -- Improved file type handling.
  ["nathom/filetype.nvim"] = {},

  -- Automatically resize splits so it's easier to see their content.
  ["anuvyklack/windows.nvim"] = require("custom.plugins.windows"),
}
