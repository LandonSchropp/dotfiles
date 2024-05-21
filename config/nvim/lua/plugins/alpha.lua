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
      dashboard.button("<Leader>n", "  New File"),
      dashboard.button("<Leader>ff", "  Find File"),
      dashboard.button("<Leader>fr", "  Find and Replace"),
      dashboard.button("<Leader>fg", "󰈭  Grep"),
      dashboard.button("<Leader>fR", "󰈙  Recents"),
      dashboard.button("<Leader>Sl", "  Last Session"),
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
