local keymap_utils = require("util.keymaps")

return {
  "williamboman/mason.nvim",
  cmd = "Mason",
  keys = function(_, keymaps)
    keymap_utils.remap(keymaps, "<leader>cm", "<leader>lm")

    return keymaps
  end,
}
