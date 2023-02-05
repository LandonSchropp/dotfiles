return {
  "goolord/alpha-nvim",
  event = "VimEnter",
  opts = function()
    local dashboard = require("alpha.themes.dashboard")

    -- Define a nice header.
    dashboard.section.header.val = {
      "            ██╗      █████╗ ███████╗██╗   ██╗██╗   ██╗██╗███╗   ███╗          Z",
      "            ██║     ██╔══██╗╚══███╔╝╚██╗ ██╔╝██║   ██║██║████╗ ████║      Z    ",
      "            ██║     ███████║  ███╔╝  ╚████╔╝ ██║   ██║██║██╔████╔██║   z       ",
      "            ██║     ██╔══██║ ███╔╝    ╚██╔╝  ╚██╗ ██╔╝██║██║╚██╔╝██║ z         ",
      "            ███████╗██║  ██║███████╗   ██║    ╚████╔╝ ██║██║ ╚═╝ ██║",
      "            ╚══════╝╚═╝  ╚═╝╚══════╝   ╚═╝     ╚═══╝  ╚═╝╚═╝     ╚═╝",
    }

    -- Redefine the buttons.
    dashboard.section.buttons.val = {
      dashboard.button("<leader>ff", "  Find File"),
      dashboard.button("<leader>fr", "  Find and Replace"),
      dashboard.button("<leader>fo", "  Recents"),
      dashboard.button("<leader>fg", "  Grep"),
      dashboard.button("<leader>n", "  New File"),
    }

    -- Define the highlights
    for _, button in ipairs(dashboard.section.buttons.val) do
      button.opts.hl = "AlphaButtons"
      button.opts.hl_shortcut = "AlphaShortcut"
    end

    dashboard.section.footer.opts.hl = "Type"
    dashboard.section.header.opts.hl = "AlphaHeader"
    dashboard.section.buttons.opts.hl = "AlphaButtons"

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
    dashboard.opts.layout[1].val = vim.fn.floor((vim.fn.winheight(0) - content_height) / 2)

    return dashboard
  end,
}
