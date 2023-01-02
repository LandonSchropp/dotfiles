return {
  override_options = function()
    local actions = require("telescope.actions")

    return {
      defaults = {
        -- Change Telescope navigation to use <C-j> and <C-k> for navigation and disable normal mode.
        mappings = {
          i = {
            ["<c-j>"] = actions.move_selection_next,
            ["<c-k>"] = actions.move_selection_previous,
            ["<down>"] = actions.move_selection_next,
            ["<up>"] = actions.move_selection_previous,
            ["<esc>"] = actions.close,
          },
        },
        -- Improve the Telescope display.
        layout_config = {
          width = 0.9,
          height = 0.9,
        },
      },
    }
  end,
}
