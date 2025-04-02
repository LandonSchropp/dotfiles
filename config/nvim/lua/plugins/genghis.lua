local function chmodx()
  require("genghis").chmodx()
end

local function move()
  require("genghis").moveAndRenameFile()
end

local function delete()
  require("genghis").trashFile()
end

return {
  "chrisgrieser/nvim-genghis",
  dependencies = "stevearc/dressing.nvim",
  keys = {
    { "<Leader>Fx", chmodx, desc = "Make file executable" },
    { "<Leader>Fm", move,   desc = "Move file" },
    { "<Leader>Fd", delete, desc = "Delete file" },
  },
}
