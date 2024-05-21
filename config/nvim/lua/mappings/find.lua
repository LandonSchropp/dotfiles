local extend = require("utilities.table").extend

local function git_files()
  require("telescope.builtin").git_files({ prompt_title = "Find Files", show_untracked = true })
end

local GIT_FILES_MAPPING = { git_files, desc = "Find Files" }

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
      ["<Leader>fr"] = false,

      -- Remap mappings
      ["<Leader><Leader>"] = GIT_FILES_MAPPING,
      ["<Leader>ff"] = GIT_FILES_MAPPING,
      ["<Leader>fR"] = mappings.n["<Leader>fo"],
      ["<Leader>fg"] = extend(mappings.n["<Leader>fw"], { desc = "Grep" }),
      ["<Leader>fH"] = { "<cmd>Telescope highlights<cr>", desc = "Highlights" },
    },
  }
end
