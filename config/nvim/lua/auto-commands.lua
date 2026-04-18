---@module "astrocore"

local is_lsp_client_active = require("utilities.lsp").is_lsp_client_active

---@type AstroCoreOpts["autocmds"]
return {
  -- Extend AstroNvim's default checktime autocmd to also trigger on BufEnter and CursorHold. This
  -- ensures buffers are reloaded after external tools (like Claude Code) edit files while Neovim is
  -- still focused.
  checktime = {
    {
      event = { "FocusGained", "TermClose", "TermLeave" },
      desc = "Check if buffers changed on editor focus",
      callback = function()
        if vim.bo.buftype ~= "nofile" then
          vim.cmd.checktime()
        end
      end,
    },
    {
      event = { "BufEnter", "CursorHold" },
      desc = "Check if buffers changed after external edits",
      callback = function()
        if vim.bo.buftype ~= "nofile" then
          vim.cmd.checktime()
        end
      end,
    },
  },
  DisableFocusNvim = {
    {
      event = { "WinEnter" },
      desc = "Disable focus.nvim for certain filetypes",
      callback = function(_)
        vim.b.focus_disable = vim.tbl_contains({ "neo-tree" }, vim.bo.filetype)
      end,
    },
  },
}
