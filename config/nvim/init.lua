-- Grab the path of Lazy.nvim
local lazy_nvim_path = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

-- If LazyVim is not installed, install it.
if not vim.loop.fs_stat(lazy_nvim_path) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazy_nvim_path
  })
end

-- Add Lazy.nvim to the Vim runtime path.
vim.opt.rtp:prepend(vim.env.LAZY or lazy_nvim_path)

-- Configure Lazy.nvim.
require("lazy").setup({
  spec = {
    { "LazyVim/LazyVim", import = "lazyvim.plugins" },
    -- import any extras modules here
    -- { import = "lazyvim.plugins.extras.lang.typescript" },
    -- { import = "lazyvim.plugins.extras.lang.json" },
    -- { import = "lazyvim.plugins.extras.ui.mini-animate" },
    { import = "plugins" },
  },
  defaults = {

    -- Only lazy load LazyVim plugins.
    lazy = false,

    -- Don't use versioning since many plugins don't supprot it yet.
    version = false,
  },

  -- Automatically install Tokyonight.
  install = { colorscheme = { "tokyonight" } },

  -- Automatically check for plugin updates.
  checker = { enabled = true },

  -- Disable some unused plugins by default.
  performance = {
    rtp = {
      disabled_plugins = {
        "gzip",
         "matchit",
        "matchparen",
        "netrwPlugin",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },
})
