local keymap_utils = require("util.keymaps")

return {
  "folke/todo-comments.nvim",
  opts = {
    highlight = {
      keyword = "bg",
      after = "",
    },
    keywords = {
      BUGFIX = { icon = " ", color = "warning" },
    },
  },
  keys = function(_, keymaps)
    keymap_utils.remove(keymaps, "<leader>xT")

    keymap_utils.remap(keymaps, "<leader>xt", "<leader>lt")
    keymap_utils.remap(keymaps, "<leader>st", "<leader>ft")

    keymap_utils.find_required(keymaps, "<leader>lt").desc = "Todos"
    keymap_utils.find_required(keymaps, "<leader>ft").desc = "Find todos"

    return keymaps
  end,
}
