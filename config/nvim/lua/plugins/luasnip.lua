return {
  "L3MON4D3/LuaSnip",
  config = function(...)
    -- Call the default AstroNvim LuaSnip configuration.
    require("astronvim.plugins.configs.luasnip")(plugin, opts)

    -- Load my custom snippets.
    require("luasnip.loaders.from_lua").load({ paths = { "./lua/snippets" } })
  end,
}
