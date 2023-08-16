return {
  "L3MON4D3/LuaSnip",
  config = function(...)
    -- Call the default AstroNvim LuaSnip configuration.
    require("plugins.configs.luasnip")(...)

    -- Load my custom snippets.
    require("luasnip.loaders.from_lua").load({ paths = "./lua/user/snippets" })
  end,
}
