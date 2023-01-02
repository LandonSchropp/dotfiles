local HEADER_HEIGHT = 11

local function button(value, shortcut)
  local on_press = function()
    local key = vim.api.nvim_replace_termcodes(shortcut, true, false, true)
    vim.api.nvim_feedkeys(key, "normal", false)
  end

  return {
    type = "button",
    val = value,
    on_press = on_press,
    opts = {
      position = "center",
      shortcut = shortcut,
      align_shortcut = "right",
      hl = "AlphaButtons",
      width = 35,
    },
  }
end

return {
  disable = false,
  override_options = function()
    -- Redefine the buttons.
    local buttons = {
      button(" Find File", "<leader>f"),
      button(" Find Text", "<leader>F"),
      button(" Recent Files", "<leader><c-f>"),
      button(" New File", "<leader>n"),
    }

    -- Vertically center the content.
    local whitespace = vim.fn.winheight(0) - HEADER_HEIGHT - 1 - table.getn(buttons)
    local header_padding = vim.fn.max({ 1, vim.fn.floor(whitespace / 2) })

    return {
      buttons = {
        type = "group",
        val = buttons,
        opts = {
          spacing = 0,
        },
      },
      headerPaddingTop = { type = "padding", val = header_padding },
      headerPaddingBottom = { type = "padding", val = 1 },
    }
  end,
}
