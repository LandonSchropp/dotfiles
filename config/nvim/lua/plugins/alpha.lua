return {
  "goolord/alpha-nvim",
  opts = function(_, opts)
    -- Redefine the header.
    opts.section.header.val = {
      " ███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗",
      " ████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║",
      " ██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║",
      " ██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║",
      " ██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║",
      " ╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝",
    }

    -- Redefine the buttons.
    opts.section.buttons.val = {
      opts.button("<Leader>n", "  New File"),
      opts.button("<Leader>ff", "󰱽  Find File"),
      opts.button("<Leader>fr", "  Find and Replace"),
      opts.button("<Leader>fg", "  Grep"),
    }

    -- Shrink the padding between the sections
    opts.section.buttons.opts.spacing = 1
    opts.opts.layout[3].val = 1
    opts.opts.layout[5].val = 0

    -- Determine the height of the content.

    -- Vertically center the layout.
    -- TODO: Figure out how to do this dynamically.
    -- local content_height = #opts.section.header.val + (#opts.section.buttons.val * 2 - 1) + 3
    -- opts.opts.layout[1].val = vim.fn.floor((vim.fn.winheight(0) - content_height + 2) / 2)

    -- TODO: Figure out why the highlights disappeared and fix them.
    opts.section.header.opts.hl = "AlphaHeader"
    opts.section.buttons.opts.hl = "AlphaButtons"
    opts.section.footer.opts.hl = "AlphaFooter"

    return opts
  end,
}
