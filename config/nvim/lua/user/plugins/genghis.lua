local function copy_path()
  require("genghis").copyFilepath()
end

local function copy_filename()
  require("genghis").copyFilename()
end

local function chmodx()
  require("genghis").chmodx()
end

local function rename_file()
  require("genghis").renameFile()
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
    { "<Leader>Fy", copy_path,     desc = "Copy path" },
    { "<Leader>FY", copy_filename, desc = "Copy name" },
    { "<Leader>Fx", chmodx,        desc = "chmod +x" },
    { "<Leader>Fr", rename_file,   desc = "Rename" },
    { "<Leader>Fm", move,          desc = "Move" },
    { "<Leader>Fd", delete,        desc = "Delete" },
  },
}
