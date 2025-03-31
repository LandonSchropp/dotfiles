return function(_)
  return {
    n = {
      ["<Leader>aa"] = { "<cmd>CodeCompanionActions<cr>", desc = "Action palette" },
      ["<Leader>ac"] = { "<cmd>CodeCompanionChat<cr>", desc = "Chat" },
      ["<Leader>ap"] = { "<cmd>CodeCompanionCmd<cr>", desc = "Command" },
    },
    v = {
      ["<Leader>aa"] = { "<cmd>CodeCompanionActions<cr>", desc = "Action palette" },
      ["<Leader>ae"] = { "<cmd>CodeCompanion /explain<cr>", desc = "Explain" },
    },
  }
end
