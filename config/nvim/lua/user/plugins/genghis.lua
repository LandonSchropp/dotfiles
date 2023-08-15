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
    { "<leader>Fy", copy_path,     desc = "Copy path" },
    { "<leader>FY", copy_filename, desc = "Copy name" },
    { "<leader>Fx", chmodx,        desc = "chmod +x" },
    { "<leader>Fr", rename_file,   desc = "Rename" },
    { "<leader>Fm", move,          desc = "Move" },
    { "<leader>Fd", delete,        desc = "Delete" },
  },
}
