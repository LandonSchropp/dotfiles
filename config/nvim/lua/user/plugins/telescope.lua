local function close(...)
  require("telescope.actions").close(...)
end

return {
  "nvim-telescope/telescope.nvim",
  opts = {
    defaults = {
      mappings = {
        i = {
          -- Disable normal mode
          ["<esc>"] = close,
        },
      },
      -- Make telescope take up the whole screen.
      layout_config = {
        width = 0.95,
        height = 0.95,
        horizontal = {
          preview_width = 0.61803398875,
        },
      },
    },
  },
}
