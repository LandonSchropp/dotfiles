require("custom.settings")
require("custom.commands")

-- HACK: Automatically run checktime whenever the Neovim window gains focus. This should make the
-- autoread behavior work as expected. (https://github.com/neovim/neovim/issues/1380)
vim.api.nvim_create_autocmd("FocusGained", {
  pattern = "*",
  callback = function()
    vim.api.nvim_command("checktime")
  end,
})
