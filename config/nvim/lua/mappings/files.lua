return function(mappings)
  return {
    n = {
      ["<Leader>e"] = false,
      ["<Leader>o"] = false,
      ["<Leader>R"] = false,
      ["<Leader>Fr"] = { mappings.n["<Leader>R"][1], desc = "Rename file" },
    },
  }
end
