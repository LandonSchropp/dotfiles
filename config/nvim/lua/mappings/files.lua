return function(mappings)
  return {
    n = {
      ["<Leader>O"] = false,
      ["<Leader>e"] = false,
      ["<Leader>o"] = false,
      ["<Leader>R"] = false,
      ["<Leader>Fr"] = { mappings.n["<Leader>R"][1], desc = "Rename" },
      ["<Leader>Fo"] = { mappings.n["<Leader>O"][1], desc = "Oil" },
    },
  }
end
