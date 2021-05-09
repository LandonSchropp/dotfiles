vim.cmd("source ~/.config/nvim/plugins.vim")
require("settings")
vim.cmd("source ~/.config/nvim/keybindings.vim")
vim.cmd("source ~/.config/nvim/syntax.vim")
vim.cmd("source ~/.config/nvim/theme.vim")

-- Plugins
vim.cmd("source ~/.config/nvim/plugin/cursor_position.vim")
vim.cmd("source ~/.config/nvim/plugin/strip_whitespace.vim")
vim.cmd("source ~/.config/nvim/plugin/test.vim")
vim.cmd("source ~/.config/nvim/plugin/rename_extension.vim")

-- Enable reading project-specific .nvimrc files
vim.api.nvim_set_option("exrc", true)
vim.api.nvim_set_option("secure", true)
