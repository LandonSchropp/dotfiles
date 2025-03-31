return function(mappings)
  return {
    n = {
      ["<Leader>O"] = false,
      ["<Leader>e"] = false,
      ["<Leader>o"] = false,
      ["<Leader>Fo"] = {
        mappings.n["<Leader>O"][1],
        desc = "Oil",
      },
    },
  }
end
