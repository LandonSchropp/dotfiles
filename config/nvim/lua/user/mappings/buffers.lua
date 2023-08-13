local extend = require("user.utilities.table").extend

local function previous_buffer()
  require("astronvim.utils.buffer").nav(-(vim.v.count > 0 and vim.v.count or 1))
end

local function next_buffer()
  require("astronvim.utils.buffer").nav(vim.v.count > 0 and vim.v.count or 1)
end

return function(mappings)
  return {
    n = {
      -- Remove mappings
      ["<leader>C"] = false,
      ["<leader>bC"] = false,
      ["<leader>b\\"] = false,
      ["<leader>bb"] = false,
      ["<leader>bl"] = false,
      ["<leader>bp"] = false,
      ["<leader>br"] = false,
      ["<leader>bse"] = false,
      ["<leader>bsi"] = false,
      ["<leader>bsm"] = false,
      ["<leader>bsp"] = false,
      ["<leader>bsr"] = false,
      ["<leader>b|"] = false,
      ["<leader>c"] = false,

      -- Remap mappings
      ["<leader>bD"] = extend(mappings.n["<leader>c"], { desc = "Delete buffer (force)" }),
      ["<leader>bS"] = extend(mappings.n["<leader>bsm"], { desc = "Sort by modification" }),
      ["<leader>bc"] = mappings.n["<leader>bC"],
      ["<leader>bd"] = extend(mappings.n["<leader>c"], { desc = "Delete buffer" }),
      ["<leader>bo"] = mappings.n["<leader>bc"],
      ["<leader>bs"] = extend(mappings.n["<leader>bsp"], { desc = "Sort by path" }),
      X = mappings.n["<leader>c"],

      -- Add mappings
      H = { previous_buffer, desc = "Previous buffer" },
      L = { next_buffer, desc = "Next buffer" },
    },
  }
end
