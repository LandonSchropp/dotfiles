return function(_)
  return {
    n = {
      -- Which Key
      ["<Leader>t"] = { desc = " Test" },
      ["<Leader>tg"] = {
        "<command>GenerateRSpecCommandsFromOutput<cr>",
        desc = "Generate RSpec Commands from Output",
      },
    },
  }
end
