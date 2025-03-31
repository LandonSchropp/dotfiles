local extend = require("utilities.table").extend

return function(mappings)
  return {
    n = {
      ["<Leader>o"] = false,
      ["<Leader>e"] = false,
    },
  }
end
