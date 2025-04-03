return {
  "L3MON4D3/LuaSnip",
  config = function(...)
    -- Call the default AstroNvim LuaSnip configuration.
    require("astronvim.plugins.configs.luasnip")(...)

    -- Load my custom snippets.
    require("luasnip.loaders.from_lua").lazy_load({
      paths = { vim.fn.stdpath("config") .. "/lua/snippets" },
    })
  end,
}
