local extend = require("user.utilities.table").extend

return function(mappings)
  return {
    n = {
      -- Remove mappings
      ["<leader>f'"] = false,
      ["<leader>f/"] = false,
      ["<leader>f<CR>"] = false,
      ["<leader>fC"] = false,
      ["<leader>fF"] = false,
      ["<leader>fW"] = false,
      ["<leader>fa"] = false,
      ["<leader>fc"] = false,
      ["<leader>fk"] = false,
      ["<leader>fm"] = false,
      ["<leader>fn"] = false,
      ["<leader>fo"] = false,
      ["<leader>ft"] = false,
      ["<leader>fw"] = false,
      ["<leader>fr"] = false,

      -- Remap mappings
      ["<leader><leader>"] = mappings.n["<leader>ff"],
      ["<leader>fR"] = mappings.n["<leader>fo"],
      ["<leader>fg"] = extend(mappings.n["<leader>fw"], { desc = "Grep" }),
    },
  }
end
