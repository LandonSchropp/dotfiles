local keymap_utils = require("util.keymaps")

return {
  "williamboman/mason.nvim",
  cmd = "Mason",
  opts = {
    ui = {
      border = "rounded",
    },
  },
  keys = function(_, keymaps)
    keymap_utils.remap(keymaps, "<leader>cm", "<leader>lm")

    return keymaps
  end,
}
