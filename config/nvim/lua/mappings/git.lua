return function(_)
  return {
    n = {
      ["<Leader>gnt"] = false,
      ["<Leader>gnc"] = false,
      ["<Leader>gnd"] = false,
      ["<Leader>gnk"] = false,
      ["<Leader>gn"] = { "<cmd>Neogit<cr>", desc = "Neogit" },
      ["<Leader>gN"] = { "<cmd>Neogit commit<cr>", desc = "Neogit commit" },
    },
  }
end
