local extend = require("utilities.table").extend

return function(mappings)
  return {
    n = {
      ["<Leader>o"] = false,
      ["<Leader>e"] = false,

      -- Remap mappings
      ["<Leader>Ft"] = extend(mappings.n["<Leader>e"], { desc = "Tree" }),
    },
  }
end
