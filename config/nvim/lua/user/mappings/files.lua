local extend = require("user.utilities.table").extend

return function(mappings)
  return {
    n = {
      -- Remove mappings
      ["<leader>o"] = false,

      -- Remap mappings
      ["<leader>Ft"] = extend(mappings.n["<leader>e"], { desc = "Tree" }),

      -- Which Key
      ["<leader>F"] = { name = "󰈔 Files" },
    },
  }
end
