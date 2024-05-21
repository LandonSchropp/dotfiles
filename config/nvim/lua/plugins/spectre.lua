return {
  "nvim-pack/nvim-spectre",
  keys = {
    {
      "<Leader>fr",
      function()
        require("spectre").toggle()
      end,
      desc = "Find/replace",
    },
  },
}
