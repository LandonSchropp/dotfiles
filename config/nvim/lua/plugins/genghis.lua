---@module "lazy"

local function chmodx()
  require("genghis").chmodx()
end

local function delete()
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
