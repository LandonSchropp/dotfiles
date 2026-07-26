---@module "lazy"

local function chmodx()
  require("genghis").chmodx()
end

-- Genghis trashes the file immediately, so confirm first.
local function delete()
  local path = vim.api.nvim_buf_get_name(0)

  -- Genghis passes the path to `trash` without validating it, and `trash ""` deletes the working
  -- directory, so unnamed buffers have to be stopped here.
  if path == "" then
    vim.notify("Cannot delete an unnamed buffer", vim.log.levels.ERROR)
    return
  end

  local relative_path = vim.fn.fnamemodify(path, ":.")

  if vim.fn.confirm(('Delete "%s"?'):format(relative_path), "&Yes\n&No", 2, "Question") ~= 1 then
    return
  end

  require("genghis").trashFile()
end

-- File operations for the current buffer. Rename and move are left out because AstroNvim's
-- <Leader>Fr prompts with the path relative to the working directory, which already covers both.
---@type LazySpec
return {
  "chrisgrieser/nvim-genghis",
  keys = {
    { "<Leader>Fd", delete, desc = "Delete file" },
    { "<Leader>Fx", chmodx, desc = "Make file executable" },
  },
}
