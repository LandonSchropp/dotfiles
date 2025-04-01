return {
  "folke/snacks.nvim",
  opts = {

    -- Customize the file picker
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

    -- Customize the dashboard.
    dashboard = {
      preset = {
        -- Redefine the header.
        header = table.concat({
          " ███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗",
          " ████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║",
          " ██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║",
          " ██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║",
          " ██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║",
          " ╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝",
        }, "\n"),

        -- Redefine the buttons.
        keys = {
          {
            key = "<leader>n",
            action = function() end,
            icon = "",
            desc = "New File",
          },
          {
            key = "<leader>ff",
            action = function() end,
            icon = "󰱽",
            desc = "Find File",
          },
          {
            key = "<leader>fg",
            action = function() end,
            icon = "",
            desc = "Find",
          },
          {
            key = "<leader>fr",
            action = function() end,
            icon = "",
            desc = "Find and Replace",
          },
        },
      },

      -- Override the padding and gaps
      sections = {
        { section = "header", padding = 0, gap = 1 },
        { section = "keys",   gap = 1,     padding = 2 },
        { section = "startup" },
      },
    },

    -- Customize the input prompt
    styles = {
      input = {
        keys = {
          -- Close the input when escape is pressed (instead of entering normal mode)
          i_esc = { "<esc>", { "cmp_close", "cancel" }, mode = "i", expr = true },
        },
      },
    },
  },
}
