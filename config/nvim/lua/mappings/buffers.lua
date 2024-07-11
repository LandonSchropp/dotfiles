local extend = require("utilities.table").extend

local function close_buffer()
  local current_buffer = vim.api.nvim_get_current_buf()
  local number_of_buffers = #vim.fn.getbufinfo({ buflisted = 1 })

  -- If alpha.nvim is already open, don't to anything.
  if vim.bo.ft == "alpha" then
    return
  end

  -- Start alpha.nvim if there's only one buffer currently open.
  if number_of_buffers == 1 and require("astrocore").is_available("alpha-nvim") then
    require("alpha").start()
  end

  -- Close the current buffer.
  require("astrocore.buffer").close(current_buffer)
end

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

      -- Navigate between buffers
      H = mappings.n["[b"],
      L = mappings.n["]b"],

      -- Save and close buffers
      W = { "<cmd>write<cr>", desc = "Write buffer" },
      X = { close_buffer, desc = "Close buffer" },
      Z = { "WX", desc = "Write and close buffer" },

      -- Yank the current buffer path
      ["<Leader>by"] = { "<cmd>let @+=expand('%:p')<cr>", desc = "Yank buffer path" },
    },
  }
end
