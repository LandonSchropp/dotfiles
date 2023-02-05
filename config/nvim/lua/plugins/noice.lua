local keymap_utils = require("util.keymaps")

return {
  "folke/noice.nvim",
  opts = {
    presets = {
      inc_rename = true,
      lsp_doc_border = true,
    },
    messages = {
      enabled = false,
    },
    notify = {
      enabled = false,
    },
  },
  keys = function(_, keymaps)
    keymap_utils.remove(keymaps, "<s-enter>")
    keymap_utils.remove(keymaps, "<leader>snl")
    keymap_utils.remove(keymaps, "<leader>snh")
    keymap_utils.remove(keymaps, "<leader>sna")

    return keymaps
  end,
}
