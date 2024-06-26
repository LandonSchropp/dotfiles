local extend = require("utilities.table").extend

return function(mappings)
  return {
    n = {
      -- Remove mappings
      ["<Leader>C"] = false,
      ["<Leader>bC"] = false,
      ["<Leader>b\\"] = false,
      ["<Leader>bb"] = false,
      ["<Leader>bl"] = false,
      ["<Leader>bp"] = false,
      ["<Leader>br"] = false,
      ["<Leader>bse"] = false,
      ["<Leader>bsi"] = false,
      ["<Leader>bsm"] = false,
      ["<Leader>bsp"] = false,
      ["<Leader>bsr"] = false,
      ["<Leader>b|"] = false,
      ["<Leader>c"] = false,

      -- Remap mappings
      ["<Leader>bD"] = extend(mappings.n["<Leader>c"], { desc = "Delete buffer (force)" }),
      ["<Leader>bS"] = extend(mappings.n["<Leader>bsm"], { desc = "Sort by modification" }),
      ["<Leader>bc"] = mappings.n["<Leader>bC"],
      ["<Leader>bd"] = extend(mappings.n["<Leader>c"], { desc = "Delete buffer" }),
      ["<Leader>bo"] = mappings.n["<Leader>bc"],
      ["<Leader>bs"] = extend(mappings.n["<Leader>bsp"], { desc = "Sort by path" }),
      X = mappings.n["<Leader>c"],

      -- Navigate between buffers
      H = mappings.n["[b"],
      L = mappings.n["]b"],

      -- Save and close buffers
      W = { "<cmd>write<cr>", desc = "Write buffer" },
      Z = { "WX", desc = "Write and close buffer" },

      -- Yank the current buffer path
      ["<Leader>by"] = { "<cmd>let @+=expand('%:p')<cr>", desc = "Yank buffer path" },
    },
  }
end
