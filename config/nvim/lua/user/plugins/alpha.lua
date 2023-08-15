return {
  "goolord/alpha-nvim",
  opts = function()
    local dashboard = require("alpha.themes.dashboard")

    -- Define a nice header.
    dashboard.section.header.val = {
      " ███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗",
      " ████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║",
      " ██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║",
      " ██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║",
      " ██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║",
      " ╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝",
    }

    -- Redefine the buttons.
    dashboard.section.buttons.val = {
      dashboard.button("<leader>n", "  New File"),
      dashboard.button("<leader>ff", "  Find File"),
      dashboard.button("<leader>fr", "  Find and Replace"),
      dashboard.button("<leader>fg", "󰈭  Grep"),
      dashboard.button("<leader>fR", "󰈙  Recents"),
      dashboard.button("<leader>Sl", "  Last Session"),
    }

    -- Shrink the padding
    dashboard.section.buttons.opts.spacing = 1
    dashboard.opts.layout[3].val = 1

    -- Determine the height of the content.
    local content_height = #dashboard.section.header.val
      + 1
      + (#dashboard.section.buttons.val * 2 - 1)
      + 1
      + 1

    -- Vertically center the layout.
    -- TODO: Figure out how to do this dynamically.
    dashboard.opts.layout[1].val = vim.fn.floor((vim.fn.winheight(0) - content_height) / 2)

    return dashboard
  end,
}
