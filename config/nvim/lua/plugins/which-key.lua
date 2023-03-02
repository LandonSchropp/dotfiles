return {
  "folke/which-key.nvim",

  -- Override the config function to remove/replace the groups.
  config = function(_, options)
    local which_key = require("which-key")

    which_key.setup(options)

    which_key.register({
      mode = { "n", "v" },
      ["g"] = { name = "+Goto" },
      ["]"] = { name = "+Next" },
      ["["] = { name = "+Prevous" },
      ["<leader>b"] = { name = "+Buffer" },
      ["<leader>l"] = { name = "+Language/LSP" },
      ["<leader>f"] = { name = "+Find" },
      ["<leader>g"] = { name = "+Git" },
      ["<leader>t"] = { name = "+Test" },
      ["<leader>gh"] = { name = "+Hunks" },
    })
  end,
}
