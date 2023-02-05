return {
  "neovim/nvim-lspconfig",
  init = function()
    local keymap_utils = require("util.keymaps")
    local keymaps = require("lazyvim.plugins.lsp.keymaps").get()

    keymap_utils.remap(keymaps, "<leader>cd", "<leader>li")
    keymap_utils.remap(keymaps, "]d", "]]")
    keymap_utils.remap(keymaps, "[d", "[[")
    keymap_utils.remap(keymaps, "<leader>ca", "<leader>la")
    keymap_utils.remap(keymaps, "<leader>cr", "<leader>lr")

    keymap_utils.remove(keymaps, "<c-k>")
    keymap_utils.remove(keymaps, "<leader>cf")
  end,
}
