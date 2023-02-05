local keymap_utils = require("util.keymaps")

return {
  "nvim-neo-tree/neo-tree.nvim",
  keys = function(_, keymaps)
    keymap_utils.remove(keymaps, "<leader>fE")
    keymap_utils.remove(keymaps, "<leader>e")
    keymap_utils.remove(keymaps, "<leader>E")

    -- Modify the description of the existing explorer keymap.
    keymap_utils.find_required(keymaps, "<leader>fe").desc = "Neotree explorer"

    return keymaps
  end,
}
