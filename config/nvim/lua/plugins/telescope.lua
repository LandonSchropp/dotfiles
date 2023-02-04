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
}
