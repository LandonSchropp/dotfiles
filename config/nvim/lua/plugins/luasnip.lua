return {
  "L3MON4D3/LuaSnip",
  -- These options were taken from the recommendations by TJ DeVries.
  -- https://youtu.be/Dn800rlPIho?t=438
  opts = {
    history = true,
    update_events = { "TextChanged", "TextChangedI" },
    enable_autosnippets = true,
  },
  config = function()
    require("luasnip.loaders.from_lua").load({ paths = "~/.config/nvim/lua/snippets/" })
  end,
}
