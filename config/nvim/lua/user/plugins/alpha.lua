return function()

  -- Grab the header.
  local header = require("ascii").art.text.neovim.ansi_shadow

  -- Define the buttons.
  local buttons = {
    astronvim.alpha_button("<leader>ff", "  Find File"),
    astronvim.alpha_button("<leader>fr", "  Find and Replace"),
    astronvim.alpha_button("<leader>fo", "  Recents"),
    astronvim.alpha_button("<leader>fw", "  Find Word"),
    astronvim.alpha_button("<leader>n", "  New File"),
  }

  -- Determine the top padding.
  local top_padding = vim.fn.floor((vim.fn.winheight(0) - #header - 1 - #buttons) / 2)

  -- Override the Alpha config.
  return {
    layout = {
      { type = "padding", val = vim.fn.max({ 1, top_padding }) },
      { type = "text", val = header, opts = { position = "center", hl = "DashboardHeader" }, },
      { type = "padding", val = 1 },
      { type = "group", val = buttons, opts = { spacing = 0 }, },
    },
    opts = { noautocmd = true },
  }
end
