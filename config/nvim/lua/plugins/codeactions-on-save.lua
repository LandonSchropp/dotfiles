---@module "lazy"

---@type LazySpec
return {
  "fnune/codeactions-on-save.nvim",
  config = function()
    local cos = require("codeactions-on-save")
    cos.register({ "*.js", "*.jsx", "*.ts", "*.tsx" }, { "source.removeUnusedImports" })
  end,
}
