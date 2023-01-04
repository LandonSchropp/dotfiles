return {
  init = {

    -------------
    -- General --
    -------------

    -- Quickly run Unix commands.
    { "tpope/vim-eunuch" },

    -- Automatically create any non-existent directories before writing the buffer
    { "pbrisbin/vim-mkdir" },

    -- Always remember the last place when editing a file.
    {
      "ethanholz/nvim-lastplace",
      event = "BufRead",
      config = function()
        require("user.plugins.lastplace")
      end,
    },

    -- Automatically change into project root directories.
    {
      "ahmedkhalf/project.nvim",
      config = function()
        require("user.plugins.project")
      end,
    },

    --------------------
    -- User Interface --
    --------------------

    -- Find and replace.
    { "windwp/nvim-spectre" },

    -- Automatically resize splits so it's easier to see their content.
    {
      "anuvyklack/windows.nvim",
      requires = { "anuvyklack/middleclass" },
      config = function()
        require("user.plugins.windows")
      end,
    },

    ------------------
    -- Text Editing --
    ------------------

    -- Quickly jump to words on the screen.
    {
      "phaazon/hop.nvim",
      event = "BufRead",
      config = function()
        require("user.plugins.hop")
      end,
    },

    -- Extra commands for surrounding text
    {
      "kylechui/nvim-surround",
      tag = "*",
      config = function()
        require("user.plugins.surround")
      end,
    },

    -- Automatically add the end keyword in Ruby and other similar languages
    {
      "RRethy/nvim-treesitter-endwise",
      requires = {
        "nvim-treesitter/nvim-treesitter",
      },
      config = function()
        require("user.plugins.treesitter-endwise")
      end,
    },

    -- Wrap and unwrap arguments and curly braces.
    {
      "AndrewRadev/splitjoin.vim",
      config = function()
        require("user.plugins.splitjoin")
      end,
    },

    -- Easy text replacement.
    { "LandonSchropp/vim-stamp" },

    -- Easily convert from camel case to underscore and back again.
    { "tpope/vim-abolish" },

    -- Swapping arguments
    { "machakann/vim-swap" },

    -- Better TypeScript support.
    {
      "jose-elias-alvarez/typescript.nvim",
      after = "nvim-lspconfig",
      config = function()
        require("user.plugins.typescript")
      end,
    },

    -- Generate documentation snippets.
    {
      "kkoomen/vim-doge",
      run = function()
        vim.cmd("call doge#install()")
      end,
      config = function()
        require("user.plugins.doge")
      end,
    },

    -- Correctly indent lists when editing markdown.
    {
      "gaoDean/autolist.nvim",
      config = function()
        require("user.plugins.autolist")
      end,
    },

    -------------------------
    -- Syntax Highlighting --
    -------------------------

    -- A nice color scheme.
    { "folke/tokyonight.nvim" },
  },

  ----------------------
  -- Disable Defaults --
  ----------------------

  -- I don't use these plugins, so I'm removing them.
  ["mrjones2014/smart-splits.nvim"] = { disable = true },
  ["akinsho/toggleterm.nvim"] = { disable = true },
  ["Shatur/neovim-session-manager"] = { disable = true },
}
