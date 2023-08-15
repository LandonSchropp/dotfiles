return {
  "nvim-pack/nvim-spectre",
  keys = {
    {
      "<leader>fr",
      function()
        require("spectre").toggle()
      end,
      desc = "Find/replace",
    },
  },
}
