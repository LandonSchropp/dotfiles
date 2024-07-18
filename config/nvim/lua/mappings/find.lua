local extend = require("utilities.table").extend

local FIND_FILES_MAPPING = {
  function()
    require("telescope.builtin").git_files({ prompt_title = "Find Files", show_untracked = true })
  end,
  desc = "Find Files",
}

return function(mappings)
  return {
    n = {
      -- Remove mappings
      ["<Leader>f'"] = false,
      ["<Leader>f/"] = false,
      ["<Leader>f<CR>"] = false,
      ["<Leader>fC"] = false,
      ["<Leader>fF"] = false,
      ["<Leader>fW"] = false,
      ["<Leader>fa"] = false,
      ["<Leader>fc"] = false,
      ["<Leader>fk"] = false,
      ["<Leader>fm"] = false,
      ["<Leader>fn"] = false,
      ["<Leader>fo"] = false,
      ["<Leader>ft"] = false,
      ["<Leader>fw"] = false,
      ["<Leader>r"] = false,

      -- Remap mappings
      ["<Leader><Leader>"] = FIND_FILES_MAPPING,
      ["<Leader>fH"] = { "<cmd>Telescope highlights<cr>", desc = "Highlights" },
      ["<Leader>fR"] = mappings.n["<Leader>fo"],
      ["<Leader>ff"] = FIND_FILES_MAPPING,
      ["<Leader>fg"] = extend(mappings.n["<Leader>fw"], { desc = "Grep" }),
      ["<Leader>fr"] = {
        function()
          require("grug-far").toggle_instance({
            instanceName = "far",
            staticTitle = "Find/Replace",
          })
        end,
        desc = "Find/replace",
      },
    },
  }
end
