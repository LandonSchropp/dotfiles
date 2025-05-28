local is_lsp_client_active = require("utilities.lsp").is_lsp_client_active

return {
  AutoRemoveUnusedImports = {
    {
      pattern = { "*.js", "*.jsx", "*.ts", "*.tsx" },
      event = { "BufWritePre" },
      desc = "Remove unused imports from TypeScript/JavaScript files",
      callback = function()
        if is_lsp_client_active("vtsls") then
          vim.cmd("VtsExec remove_unused_imports")
        end
      end,
    },
  },
}
