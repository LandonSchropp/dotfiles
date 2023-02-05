local keymap_utils = require("util.keymaps")

return {
  "echasnovski/mini.bufremove",
  keys = function(_, keymaps)
    keymap_utils.duplicate(keymaps, "<leader>bd", "X")
  end,
}
