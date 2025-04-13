---@module "lazy"

---@type LazySpec
return {
  "L3MON4D3/LuaSnip",
  config = function(...)
    -- Call the default AstroNvim LuaSnip configuration.
    require("astronvim.plugins.configs.luasnip")(...)

    -- Extend Luasnip file types
    require("luasnip").filetype_extend("typescript", { "javascript" })
    require("luasnip").filetype_extend("javascriptreact", { "javascript" })
    require("luasnip").filetype_extend(
      "typescriptreact",
      { "javascript", "typescript", "javascriptreact" }
    )

    -- Load my custom snippets.
    require("luasnip.loaders.from_lua").lazy_load({
      paths = { vim.fn.stdpath("config") .. "/lua/snippets" },
    })
  end,
}
