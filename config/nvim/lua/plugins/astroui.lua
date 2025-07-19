---@module "lazy"
---@module "astroui"

---@type LazySpec
return {
  "AstroNvim/astroui",
  init = function()
    -- TODO: The astroui highlight configuration isn't quite working with highlight groups. This is
    -- a temporary workaround until that issue is resolved.
    --
    -- https://github.com/AstroNvim/astroui/issues/61
    vim.schedule(function()
      -- Style the markdown tables
      local non_text = vim.api.nvim_get_hl(0, { name = "NonText" })
      vim.api.nvim_set_hl(0, "RenderMarkdownTableHead", { fg = non_text.fg })
      vim.api.nvim_set_hl(0, "RenderMarkdownTableRow", { fg = non_text.fg })
    end)
  end,
  ---@type AstroUIOpts
  opts = {
    colorscheme = "tokyonight-storm",
  },
}
