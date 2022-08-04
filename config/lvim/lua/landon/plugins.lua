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

  -- Always remember the last place when editing a file.
  {
    "ethanholz/nvim-lastplace",
    event = "BufRead",
    config = function()
      require("nvim-lastplace").setup({
        lastplace_ignore_buftype = { "quickfix", "nofile", "help" },
        lastplace_ignore_filetype = { "gitcommit", "gitrebase" },
      })
    end,
  },

  -- Improved quickfix list.
  { "kevinhwang91/nvim-bqf" },

  -- Improved file type handling.
  { "nathom/filetype.nvim" },

  -- Provide a way to quickly open "alternate" files, such as specs.
  { "tpope/vim-projectionist" },

  -- Automatically resize splits so it's easier to see their content.
  {
    "beauwilliams/focus.nvim",
    config = function()
      require("focus").setup({ width = 102, minwidth = 0 })
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
  {
    "jose-elias-alvarez/typescript.nvim",
    config = function()
      require("typescript").setup()
    end,
  },

  -- Generate documentation snippits.
  {
    "kkoomen/vim-doge",
    run = function()
      vim.cmd("call doge#install()")
    end,
  },

  -- SYNTAX HIGHLIGHTING

  -- Better Git conflict highlighting.
  { "rhysd/conflict-marker.vim" },

  -- A nice color scheme.
  { "folke/tokyonight.nvim" },

  -- Highlight CSS colors
  { "ap/vim-css-color" },
}
