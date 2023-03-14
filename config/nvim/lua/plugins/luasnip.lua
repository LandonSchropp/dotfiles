local load_snippets = function()
  require("luasnip.loaders.from_lua").load({ paths = "~/.config/nvim/lua/snippets/" })
end

return {
  "L3MON4D3/LuaSnip",
  -- These options were taken from the recommendations by TJ DeVries.
  -- https://youtu.be/Dn800rlPIho?t=438
  opts = {
    history = true,
    update_events = { "TextChanged", "TextChangedI" },
    enable_autosnippets = true,
  },
  config = load_snippets,
  keys = {
    {
      "<c-n>",
      function()
        local luasnip = require("luasnip")

        if luasnip.choice_active() then
          luasnip.change_choice(1)
        end
      end,
      mode = { "i", "s" },
      desc = "Swap Luasnip choice",
    },
    {
      "<leader>ls",
      load_snippets,
      desc = "Reload snippets",
    },
  },
}
