local extend = require("utilities.table").extend

return function(mappings)
  return {
    n = {
      -- Remove mappings
      ["<Leader>f'"] = false,
      ["<Leader>f/"] = false,
      ["<Leader>f<CR>"] = false,
      ["<Leader>fC"] = false,
      ["<Leader>fF"] = false,
      ["<Leader>fW"] = false,
      ["<Leader>fa"] = false,
      ["<Leader>fc"] = false,
      ["<Leader>fk"] = false,
      ["<Leader>fm"] = false,
      ["<Leader>fn"] = false,
      ["<Leader>fo"] = false,
      ["<Leader>ft"] = false,
      ["<Leader>fw"] = false,
      ["<Leader>r"] = false,

      -- Remap mappings
      ["<Leader><Leader>"] = mappings.n["<Leader>ff"],
      ["<Leader>fH"] = { "<cmd>Telescope highlights<cr>", desc = "Highlights" },
      ["<Leader>fR"] = mappings.n["<Leader>fo"],
      ["<Leader>fg"] = extend(mappings.n["<Leader>fw"], { desc = "Grep" }),
      ["<Leader>fr"] = {
        function()
          require("grug-far").toggle_instance({
            instanceName = "far",
            staticTitle = "Find/Replace",
          })
        end,
        desc = "Find/replace",
      },
    },
  }
end
