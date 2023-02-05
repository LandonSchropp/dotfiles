local keymap_utils = require("util.keymaps")

return {
  "windwp/nvim-spectre",
  keys = function(_, keymaps)
    keymap_utils.remap(keymaps, "<leader>sr", "<leader>fr")
    keymap_utils.find_required(keymaps, "<leader>fr").desc = "Find and replace"

    return keymaps
  end,
}
