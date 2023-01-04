return function()
  -- Define a nice header.
  local header = {
    " █████╗  ███████╗ ████████╗ ██████╗   ██████╗      ███╗   ██╗ ██╗   ██╗ ██╗ ███╗   ███╗",
    "██╔══██╗ ██╔════╝ ╚══██╔══╝ ██╔══██╗ ██╔═══██╗     ████╗  ██║ ██║   ██║ ██║ ████╗ ████║",
    "███████║ ███████╗    ██║    ██████╔╝ ██║   ██║     ██╔██╗ ██║ ██║   ██║ ██║ ██╔████╔██║",
    "██╔══██║ ╚════██║    ██║    ██╔══██╗ ██║   ██║     ██║╚██╗██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║",
    "██║  ██║ ███████║    ██║    ██║  ██║ ╚██████╔╝     ██║ ╚████║  ╚████╔╝  ██║ ██║ ╚═╝ ██║",
    "╚═╝  ╚═╝ ╚══════╝    ╚═╝    ╚═╝  ╚═╝  ╚═════╝      ╚═╝  ╚═══╝   ╚═══╝   ╚═╝ ╚═╝     ╚═╝",
  }

  -- Define the buttons.
  local buttons = {
    astronvim.alpha_button("<leader>ff", "  Find File"),
    astronvim.alpha_button("<leader>fr", "  Find and Replace"),
    astronvim.alpha_button("<leader>fo", "  Recents"),
    astronvim.alpha_button("<leader>fw", "  Find Word"),
    astronvim.alpha_button("<leader>n", "  New File"),
  }

  -- Define the padding between the items.
  local middle_padding = 2

  -- Determine the top padding.
  local content_height = #header + middle_padding + (#buttons * 2 - 1)
  local top_padding = vim.fn.floor((vim.fn.winheight(0) - content_height) / 2)

  -- Override the Alpha config.
  return {
    layout = {
      { type = "padding", val = vim.fn.max({ 1, top_padding }) },
      { type = "text", val = header, opts = { position = "center", hl = "DashboardHeader" } },
      { type = "padding", val = middle_padding },
      { type = "group", val = buttons, opts = { spacing = 1 } },
    },
    opts = { noautocmd = true },
  }
end
