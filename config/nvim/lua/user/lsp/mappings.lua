local deep_extend = require("user.utilities.table").deep_extend

return function(mappings)
  local updated_mappings = deep_extend(mappings, {
    n = {
      -- Remove mappings
      ["<leader>li"] = false,

      -- Remap
      ["<leader>lIl"] = mappings.n["<leader>li"],
      ["<leader>lIn"] = mappings.n["<leader>lI"],
    },
  })

  -- Override the base mapping. This can't be done inside of deep_extend because the result will
  -- just be merged with the existing function.
  updated_mappings.n["<leader>lI"] = { name = " Info" }

  return updated_mappings
end
