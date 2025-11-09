local lazypath = vim.env.LAZY or vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

-- If Lazy.nvim is not installed, then install it.
if not (vim.env.LAZY or (vim.uv or vim.loop).fs_stat(lazypath)) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end

-- Ensure that Lazy.nvim is available in the path.
vim.opt.rtp:prepend(lazypath)

-- Validate that lazy is available
if not pcall(require, "lazy") then
  vim.api.nvim_echo({
    { ("Unable to load lazy from: %s\n"):format(lazypath), "ErrorMsg" },
    { "Press any key to exit...",                          "MoreMsg" },
  }, true, {})
  vim.fn.getchar()
  vim.cmd.quit()
end

-- Start Lazy.nvim
require("lazy_setup")
require("socket")

-- HACK: Monkey patch Neovim to prevent deprecation warnings. This can be removed once the
-- tbl_islist deprecation is fixed in whatever plugins are tripping it.
vim.deprecate = function() end
