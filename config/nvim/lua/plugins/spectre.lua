local keymap_utils = require("util.keymaps")

return {
  "windwp/nvim-spectre",
  keys = function(_, keymaps)
    keymap_utils.remove(keymaps, "<leader>sr")

    -- Add a custom open function that opens Spectre in insert mode.
    keymap_utils.add(keymaps, "<leader>fr", function()
      require("spectre").open({ is_insert_mode = true })
    end, { desc = "Find and replace" })

    return keymaps
  end,
}
