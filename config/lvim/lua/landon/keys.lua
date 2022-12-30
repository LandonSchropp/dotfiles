local actions = require("telescope.actions")

-- Switch between keys by default.
lvim.keys.normal_mode["L"] = ":BufferLineCycleNext<CR>"
lvim.keys.normal_mode["H"] = ":BufferLineCyclePrev<CR>"

-- Add mappings for commenting.
lvim.builtin.comment.create_mappings = false

-- Alias the Eunuch commands (expect for Move and Wall)
vim.cmd('cabbrev remove <c-r>=getcmdpos() == 1 && getcmdtype() == ":" ? "Delete" : "remove"<cr>')
vim.cmd('cabbrev delete <c-r>=getcmdpos() == 1 && getcmdtype() == ":" ? "Delete" : "delete"<cr>')
vim.cmd('cabbrev unlink <c-r>=getcmdpos() == 1 && getcmdtype() == ":" ? "Unlink" : "unlink"<cr>')
vim.cmd('cabbrev rename <c-r>=getcmdpos() == 1 && getcmdtype() == ":" ? "Rename" : "rename"<cr>')
vim.cmd('cabbrev chmod <c-r>=getcmdpos() == 1 && getcmdtype() == ":" ? "Chmod" : "chmod"<cr>')
vim.cmd('cabbrev mkdir <c-r>=getcmdpos() == 1 && getcmdtype() == ":" ? "Mkdir" : "mkdir"<cr>')
vim.cmd('cabbrev find <c-r>=getcmdpos() == 1 && getcmdtype() == ":" ? "Find" : "find"<cr>')
vim.cmd('cabbrev locate <c-r>=getcmdpos() == 1 && getcmdtype() == ":" ? "Locate" : "locate"<cr>')
vim.cmd(
  'cabbrev sudowrite <c-r>=getcmdpos() == 1 && getcmdtype() == ":" ? "Sudowrite" : "sudowrite"<cr>'
)
vim.cmd(
  'cabbrev sudoedit <c-r>=getcmdpos() == 1 && getcmdtype() == ":" ? "Sudoedit" : "sudoedit"<cr>'
)

-- Disable Ex mode
lvim.keys.normal_mode["Q"] = "<nop>"
lvim.keys.normal_mode["gQ"] = "<nop>"

-- Change Telescope navigation to use <C-j> and <C-k> for navigation, as well as disabling "normal
-- mode".
-- TODO: Downcase these mappings once this issue is fixed: https://bit.ly/3AaQxfd.

lvim.builtin.telescope.defaults.mappings = {
  i = {
    ["<C-j>"] = actions.move_selection_next,
    ["<C-k>"] = actions.move_selection_previous,
    ["<down>"] = actions.move_selection_next,
    ["<up>"] = actions.move_selection_previous,
    ["<esc>"] = actions.close,
  },
}

-- Configure which-key to only open for the leader or if the ? key is pressed.
lvim.builtin.which_key.setup.triggers = { "<leader>" }
lvim.keys.normal_mode["?"] = ":WhichKey<cr>"

-- Configure hop.
vim.api.nvim_set_keymap("n", "\\", ":HopWord<cr>", { silent = true })

-- Disable the annoying block visual mode keymappings.
lvim.keys.visual_block_mode["J"] = ""
lvim.keys.visual_block_mode["K"] = ""

-- Disable the vim-doge default key mappings.
vim.api.nvim_set_var("doge_enable_mappings", false)

-- Add Trouble mapping.
lvim.builtin.which_key.mappings["t"] = {
  "<cmd>Trouble lsp_document_diagnostics<cr>",
  "Trouble Diagnostics",
}

-- Add diagnostics mappings.
lvim.keys.normal_mode["[["] = "<cmd>lua vim.diagnostic.goto_prev()<cr>"
lvim.keys.normal_mode["]]"] = "<cmd>lua vim.diagnostic.goto_next()<cr>"

-- Use Spectre for find and replace.
lvim.builtin.which_key.mappings["F"] = {
  function()
    require("spectre").open({
      is_open_target_win = false,
      is_insert_mode = true,
    })
  end,
  "Find Text",
}

-- Replace the built-in Telescope find_files matcher with something that will find hidden files,
-- respect the .gitignore implementation, and not display the .git directory contents.
lvim.builtin.which_key.mappings["f"] = {
  "<cmd>Telescope find_files find_command=rg,--ignore,--hidden,--files,--glob,!.git/<cr>",
  "Find File",
}

lvim.builtin.which_key.mappings["s"]["g"] = {
  lvim.builtin.which_key.mappings["s"]["t"][1],
  "Live Grep",
}

lvim.builtin.which_key.mappings["s"]["t"] = lvim.builtin.which_key.mappings["F"]

-- Set up JavaScript/TypeScript helpers.
lvim.builtin.which_key.mappings["j"] = {
  name = "JavaScript/TypeScript",
  i = { "<cmd>lua require('typescript').actions.addMissingImports()<cr>", "Import All" },
  f = { "<cmd>lua require('typescript').actions.fixAll()<cr>", "Fix Issues" },
  d = { "<cmd>DogeGenerate<cr>", "Generate Documentation" },
}

-- Bind my own quit commands.
lvim.builtin.which_key.mappings["q"] = { "<cmd>wqa<cr>", "Save and Quit" }
lvim.builtin.which_key.mappings["Q"] = { "<cmd>qa!<cr>", "Quit Without Saving" }

-- Remove unused key bindings.
lvim.builtin.which_key.mappings["/"] = nil
lvim.builtin.which_key.mappings["e"] = nil
lvim.builtin.which_key.mappings["h"] = nil
lvim.builtin.which_key.mappings[";"] = nil
lvim.builtin.which_key.mappings["g"] = nil
lvim.builtin.which_key.mappings["w"] = nil
lvim.builtin.which_key.mappings["c"] = nil
lvim.builtin.which_key.mappings["<leader>d"] = nil

-- Add yank helpers.
lvim.builtin.which_key.mappings["y"] = {
  name = "Yank",
  p = { "<cmd>let @+=expand('%:p')<cr>", "Copy Buffer Path" },
}
