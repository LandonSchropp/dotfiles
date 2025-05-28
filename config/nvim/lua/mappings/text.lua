return function(mappings)
  return {
    n = {
      -- Prevent the cursor from jumping when joining lines
      J = { "mzJ`z", desc = "Join" },

      -- Hop.nvim
      ["s"] = false,
      ["<S-s>"] = false,
      ["\\"] = mappings.n.s,
    },
    v = {
      -- Hop.nvim
      ["s"] = false,
      ["<S-s>"] = false,
      ["\\"] = mappings.v.s,
    },
  }
end
