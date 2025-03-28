-- lazy.nvim
return {
  "folke/snacks.nvim",
  opts = {
    picker = {
      layout = {
        -- Make the picker take up the full window by default.
        fullscreen = true,
      },

      win = {
        -- Close the picker on escape instead of going into normal mode.
        input = {
          keys = {
            ["<Esc>"] = { "close", mode = { "n", "i" } },
          },
        },
      },
    },
  },
}
