return {

  -------------
  -- General --
  -------------

  -- Modern syntax parsing and highlighting
  ["nvim-treesitter/nvim-treesitter"] = require("custom.plugins.treesitter"),

  -- Quickly run Unix commands.
  ["tpope/vim-eunuch"] = {},

  -- Automatically create any non-existent directories before writing the buffer
  ["pbrisbin/vim-mkdir"] = {},

  -- Always remember the last place when editing a file.
  ["ethanholz/nvim-lastplace"] = require("custom.plugins.lastplace"),

  -- Improved file type handling.
  ["nathom/filetype.nvim"] = {},

  --------------------
  -- User Interface --
  --------------------

  -- Displays a pop up showing key bindings.
  ["folke/which-key.nvim"] = require("custom.plugins.which_key"),

  -- Find and replace.
  ["windwp/nvim-spectre"] = {},

  -- Automatically resize splits so it's easier to see their content.
  ["anuvyklack/windows.nvim"] = require("custom.plugins.windows"),

  -- Display a nifty start screen.
  ["goolord/alpha-nvim"] = require("custom.plugins.alpha"),

  -- NvChad's built-in UI framework.
  ["NvChad/ui"] = require("custom.plugins.ui"),

  -- A better bufferline.
  ["akinsho/bufferline.nvim"] = require("custom.plugins.bufferline"),

  ------------------
  -- Text Editing --
  ------------------

  -- Quickly jump to words on the screen.
  ["phaazon/hop.nvim"] = require("custom.plugins.hop"),

  -- Extra commands for surrounding text
  ["kylechui/nvim-surround"] = require("custom.plugins.surround"),

  -- Automatically add the end keyword in Ruby and other similar languages
  ["RRethy/nvim-treesitter-endwise"] = require("custom.plugins.treesitter_endwise"),

  -- Wrap and unwrap arguments and curly braces.
  ["AndrewRadev/splitjoin.vim"] = {},

  -- Easy text replacement.
  ["LandonSchropp/vim-stamp"] = {},

  -- Easily convert from camel case to underscore and back again.
  ["tpope/vim-abolish"] = {},

  -- Undo tree
  ["mbbill/undotree"] = {},

  -- Swapping arguments
  ["machakann/vim-swap"] = {},

  -- Automatically close HTML tags.
  ["windwp/nvim-ts-autotag"] = require("custom.plugins.autotag"),

  -- Better TypeScript support.
  ["jose-elias-alvarez/typescript.nvim"] = require("custom.plugins.typescript"),

  -- Generate documentation snippets.
  ["kkoomen/vim-doge"] = require("custom.plugins.doge"),

  -- Correctly indent lists when editing markdown.
  ["gaoDean/autolist.nvim"] = require("custom.plugins.autolist"),

  -------------------------
  -- Syntax Highlighting --
  -------------------------

  -- A nice color scheme.
  ["folke/tokyonight.nvim"] = {},
}
