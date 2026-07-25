return function(mappings)
  return {
    n = {
      ["<Leader>e"] = false,
      ["<Leader>o"] = false,
      ["<Leader>R"] = false,
      ["<Leader>Fa"] = { "<Cmd>Other<CR>", desc = "Alternative file" },
      ["<Leader>Fr"] = { mappings.n["<Leader>R"][1], desc = "Rename file" },
    },
  }
end
