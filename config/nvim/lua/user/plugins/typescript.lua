local extend = require("user.utilities.table").extend

return {
  "jose-elias-alvarez/typescript.nvim",
  opts = function()
    local opts = require("astronvim.utils.lsp").config("tsserver")
    return { server = opts }
  end,
}
