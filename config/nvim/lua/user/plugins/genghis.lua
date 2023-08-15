return {
  "chrisgrieser/nvim-genghis",
  dependencies = "stevearc/dressing.nvim",
  keys = function()
    local genghis = require("genghis")

    return {
      { "<leader>Fy", genghis.copyFilepath,      desc = "Copy path" },
      { "<leader>FY", genghis.copyFilename,      desc = "Copy name" },
      { "<leader>Fx", genghis.chmodx,            desc = "chmod +x" },
      { "<leader>Fr", genghis.renameFile,        desc = "Rename" },
      { "<leader>Fm", genghis.moveAndRenameFile, desc = "Move and rename" },
      { "<leader>Fd", genghis.trashFile,         desc = "Delete" },
    }
  end,
}
