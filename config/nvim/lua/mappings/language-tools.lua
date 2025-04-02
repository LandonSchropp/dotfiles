local extend = require("utilities.table").extend

return function(mappings)
  return {
    n = {
      ["<Leader>ld"] = {
        function()
          require("neogen").generate()
        end,
        desc = "Generate documentation",
      },
    },
  }
end
