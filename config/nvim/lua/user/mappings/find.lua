local extend = require("user.utilities.table").extend

local function git_files()
  require("telescope.builtin").git_files({ prompt_title = "Find Files" })
end

local GIT_FILES_MAPPING = { git_files, desc = "Find Files" }

return function(mappings)
  return {
    n = {
      -- Remove mappings
      ["<leader>f'"] = false,
      ["<leader>f/"] = false,
      ["<leader>f<CR>"] = false,
      ["<leader>fC"] = false,
      ["<leader>fF"] = false,
      ["<leader>fW"] = false,
      ["<leader>fa"] = false,
      ["<leader>fc"] = false,
      ["<leader>fk"] = false,
      ["<leader>fm"] = false,
      ["<leader>fn"] = false,
      ["<leader>fo"] = false,
      ["<leader>ft"] = false,
      ["<leader>fw"] = false,
      ["<leader>fr"] = false,

      -- Remap mappings
      ["<leader><leader>"] = GIT_FILES_MAPPING,
      ["<leader>ff"] = GIT_FILES_MAPPING,
      ["<leader>fR"] = mappings.n["<leader>fo"],
      ["<leader>fg"] = extend(mappings.n["<leader>fw"], { desc = "Grep" }),
      ["<leader>fH"] = { "<cmd>Telescope highlights<cr>", desc = "Highlights" },
    },
  }
end
