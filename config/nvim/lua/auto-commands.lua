---@module "astrocore"

local is_lsp_client_active = require("utilities.lsp").is_lsp_client_active

---@type AstroCoreOpts["autocmds"]
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
