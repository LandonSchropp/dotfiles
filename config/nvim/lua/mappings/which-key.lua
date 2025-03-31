local mappings = {
  ["<Leader>a"] = { desc = "󰚩 AI" },
  ["<Leader>F"] = { desc = "󰈔 Files" },
  ["<Leader>t"] = { desc = " Test" },
}

return function(_)
  return {
    n = mappings,
    v = mappings,
  }
end
