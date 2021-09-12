lvim.plugins = {

  -- GENERAL

  -- Displays diagnostics, references, telescope results, quickfix and location lists.
  { "folke/trouble.nvim" },

  -- Quickly run Unix commands.
  { "tpope/vim-eunuch" },

  -- Automatically create any non-existent directories before writing the buffer
  { "pbrisbin/vim-mkdir" },

  -- Enable support for the repeat command with other plugins
  { "tpope/vim-repeat" },

  -- Extra commands for surrounding text
  { "tpope/vim-surround" },

  -- Find and replace.
  { "windwp/nvim-spectre" },

  -- Quickly jump to words on the screen.
  {
    "phaazon/hop.nvim",
    event = "BufRead",
    config = function()
      require("hop").setup()
    end,
  },

  -- TEXT EDITING

  -- Provides new motions to target when running operators
  { "wellle/targets.vim" },

  -- Automatically add the end keyword in Ruby and other similar languages
  -- TODO: Replace this with the [built-in](https://github.com/windwp/nvim-autopairs/wiki/Endwise)
  -- functionality of nvim-autopairs at some point?
  { "tpope/vim-endwise" },

  -- Wrap and unwrap arguments and curly braces.
  { "AndrewRadev/splitjoin.vim" },

  -- Easy text replacement.
  { "LandonSchropp/vim-stamp" },

  -- Easily convert from camel case to underscore and back again.
  { "tpope/vim-abolish" },

  -- Undo tree
  { "mbbill/undotree" },

  -- Swapping arguments
  { "machakann/vim-swap" },

  -- Automatically close HTML tags.
  {
    "windwp/nvim-ts-autotag",
    event = "InsertEnter",
    config = function()
      require("nvim-ts-autotag").setup()
    end,
  },

  -- Better TypeScript support.
  { "jose-elias-alvarez/nvim-lsp-ts-utils" },

  -- SYNTAX HIGHLIGHTING

  -- Better Git conflict highlighting.
  { "rhysd/conflict-marker.vim" },

  -- A nice color scheme.
  { "folke/tokyonight.nvim" },

  -- Highlight CSS colors
  { "ap/vim-css-color" },
}
