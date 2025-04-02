local extend = require("utilities.table").extend

return function(mappings)
  return {
    n = {
      ["<Leader>fW"] = false,
      ["<Leader>fa"] = false,
      ["<Leader>fp"] = false,
      ["<Leader>fo"] = false,
      ["<Leader>fO"] = false,
      ["<Leader>fw"] = false,
      ["<Leader><Leader>"] = mappings.n["<Leader>ff"],
      ["<Leader>fH"] = {
        function()
          require("snacks").picker.highlights()
        end,
        desc = "Find highlights",
      },
      ["<Leader>fR"] = extend(mappings.n["<Leader>fo"], { desc = "Find recent" }),
      ["<Leader>fg"] = extend(mappings.n["<Leader>fw"], { desc = "Grep" }),
      ["<Leader>fr"] = {
        function()
          require("grug-far").toggle_instance({
            instanceName = "far",
            staticTitle = "Find and Replace",
          })
        end,
        desc = "Find and replace",
      },
    },
  }
end
