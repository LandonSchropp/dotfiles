local extend = require("utilities.table").extend

return function(mappings)
  return {
    n = {
      -- Remove mappings
      ["<Leader>o"] = false,
      ["<Leader>e"] = false,

      -- Remap mappings
      ["<Leader>Ft"] = extend(mappings.n["<Leader>e"], { desc = "Tree" }),

      -- Which Key
      ["<Leader>F"] = { name = "󰈔 Files" },
    },
  }
end
