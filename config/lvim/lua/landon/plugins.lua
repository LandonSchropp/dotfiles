lvim.plugins = {

  -- TEXT EDITING

  -- Provides new motions to target when running operators
  { "wellle/targets.vim" },

  -- Automatically add the end keyword in Ruby and other similar languages
  {
    "RRethy/nvim-treesitter-endwise",
    config = function()
      require("nvim-treesitter.configs").setup({ endwise = { enable = true } })
    end,
  },

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
      require("typescript").setup({})
    end,
  },

  -- Generate documentation snippets.
  {
    "kkoomen/vim-doge",
    run = function()
      vim.cmd("call doge#install()")
    end,
  },

  -- Correctly indent lists when editing markdown.
  {
    "gaoDean/autolist.nvim",
    config = function()
      require("autolist").setup({})
    end,
  },

  -- SYNTAX HIGHLIGHTING

  -- Better Git conflict highlighting.
  { "rhysd/conflict-marker.vim" },

  -- A nice color scheme.
  { "folke/tokyonight.nvim" },

  -- Highlight CSS colors
  {
    "NvChad/nvim-colorizer.lua",
    config = function()
      require("colorizer").setup()
    end,
  },
}
