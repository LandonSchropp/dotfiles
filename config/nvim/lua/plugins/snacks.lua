---@module "lazy"

---@type LazySpec
return {
  "folke/snacks.nvim",
  opts = {

    -- Customize the file picker
    picker = {
      sort = {
        -- Disable sorting by file length
        fields = { "score:desc", "idx" },
      },
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

        -- FIX: Remove the buttons. These were preventing the mappings from working.
        keys = {},
      },

      -- Override the padding and gaps
      sections = {
        { section = "header", padding = 0, gap = 1 },
        { section = "keys",   padding = 2, gap = 1 },
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

      dashboard = {
        relative = "editor",
        -- Prevent the dashboard from closing when <esc> is pressed
        on_win = function(self)
          vim.schedule(function()
            vim.keymap.del("n", "<Esc>", { buffer = self.buf })
          end)
        end,
      },

      notification = {
        wo = {
          -- Make the notifications wrap.
          wrap = true,
        },
      },
    },
  },
}
