local keymap_utils = require("util.keymaps")

return {
  "nvim-telescope/telescope.nvim",
  opts = function()
    local actions = require("telescope.actions")

    return {
      defaults = {
        mappings = {
          i = {
            -- Disable normal mode
            ["<esc>"] = actions.close,
          },
        },
        -- Improve the Telescope display.
        layout_config = {
          width = 0.95,
          height = 0.95,
          horizontal = {
            preview_width = 0.61803398875,
          },
        },
      },
    }
  end,
  keys = function(_, keymaps)
    -- Remove the bindings I don't like or don't use.
    keymap_utils.remove(keymaps, "<leader>,")
    keymap_utils.remove(keymaps, "<leader>/")
    keymap_utils.remove(keymaps, "<leader>:")
    keymap_utils.remove(keymaps, "<leader>fr")
    keymap_utils.remove(keymaps, "<leader>fF")
    keymap_utils.remove(keymaps, "<leader>sa")
    keymap_utils.remove(keymaps, "<leader>sc")
    keymap_utils.remove(keymaps, "<leader>sC")
    keymap_utils.remove(keymaps, "<leader>sd")
    keymap_utils.remove(keymaps, "<leader>sH")
    keymap_utils.remove(keymaps, "<leader>sk")
    keymap_utils.remove(keymaps, "<leader>sM")
    keymap_utils.remove(keymaps, "<leader>sm")
    keymap_utils.remove(keymaps, "<leader>so")
    keymap_utils.remove(keymaps, "<leader>sw")
    keymap_utils.remove(keymaps, "<leader>sW")
    keymap_utils.remove(keymaps, "<leader>uC")
    keymap_utils.remove(keymaps, "<leader>ss")

    -- Remap some of the bindings.
    keymap_utils.remap(keymaps, "<leader>sb", "<leader>fb")
    keymap_utils.remap(keymaps, "<leader>sg", "<leader>fg")
    keymap_utils.remap(keymaps, "<leader>sh", "<leader>fh")

    -- Change the descriptions of some of the built-in keymaps.
    keymap_utils.find_required(keymaps, "<leader><space>").desc = "Find files"
    keymap_utils.find_required(keymaps, "<leader>ff").desc = "Find files"
    keymap_utils.find_required(keymaps, "<leader>fg").desc = "Grep"

    return keymaps
  end,
}