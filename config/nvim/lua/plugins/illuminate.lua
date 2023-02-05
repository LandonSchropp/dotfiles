local keymap_utils = require("util.keymaps")

return {
  "RRethy/vim-illuminate",
  keys = function(_, keymaps)
    keymap_utils.remap(keymaps, "]]", "]n")
    keymap_utils.remap(keymaps, "[[", "[n")

    return keymaps
  end,
}
