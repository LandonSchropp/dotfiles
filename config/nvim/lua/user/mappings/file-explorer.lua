local extend = require("user.utilities.table").extend

return function(mappings)
  return {
    n = {
      -- Remove mappings
      ["<leader>o"] = false,

      -- Remap mappings
      ["<leader>e"] = extend(mappings.n["<leader>e"], { desc = "File explorer" }),
    },
  }
end
