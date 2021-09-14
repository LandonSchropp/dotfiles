local actions = require("telescope.actions")

-- Set the leader.
lvim.leader = "space"

-- Prevent the cursor from jumping when joining lines
lvim.keys.normal_mode["J"] = "mzJ`z"

-- Make Y's behavior match D and C
lvim.keys.normal_mode["Y"] = "y$"

-- Make the default navigation keys respect wrapped lines.
lvim.keys.normal_mode["k"] = "gk"
lvim.keys.normal_mode["j"] = "gj"
lvim.keys.normal_mode["0"] = "g0"
lvim.keys.normal_mode["^"] = "g^"
lvim.keys.normal_mode["$"] = "g$"

-- Add mappings for commenting.
lvim.builtin.comment.create_mappings = false
lvim.keys.normal_mode["gc"] = ":CommentToggle<cr>"
lvim.keys.visual_mode["gc"] = ":CommentToggle<cr>"

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

-- Use the up arrow key to trigger a search through history.
lvim.keys.normal_mode["<up>"] = ":<up>"

-- Create more convenient shortcuts for yanking to the system keyboard and pasting from the system
-- keyboard.
lvim.keys.normal_mode["gy"] = '"*y'
lvim.keys.normal_mode["gp"] = '"*p'
lvim.keys.normal_mode["gY"] = '"*y$'
lvim.keys.visual_mode["gy"] = '"*y'
lvim.keys.visual_mode["gp"] = '"*p'
lvim.keys.visual_block_mode["gy"] = '"*y'
lvim.keys.visual_block_mode["gp"] = '"*p'

-- Disable Ex mode
lvim.keys.normal_mode["Q"] = "<nop>"
lvim.keys.normal_mode["gQ"] = "<nop>"

-- Use double escape to clear the highlights.
lvim.keys.normal_mode["<esc>"] = ":nohlsearch<cr>"

-- Change Telescope navigation to use <C-j> and <C-k> for navigation, as well as disabling "normal
-- mode".
lvim.builtin.telescope.on_config_done = function()
  lvim.builtin.telescope.defaults.mappings.i["<C-j>"] = actions.move_selection_next
  lvim.builtin.telescope.defaults.mappings.i["<C-k>"] = actions.move_selection_previous
  lvim.builtin.telescope.defaults.mappings.i["<down>"] = actions.move_selection_next
  lvim.builtin.telescope.defaults.mappings.i["<up>"] = actions.move_selection_previous
  lvim.builtin.telescope.defaults.mappings.i["<cr>"] = actions.file_tab
end

-- Configure which-key to only open for the leader or if the ? key is pressed.
lvim.builtin.which_key.setup.triggers = { "<leader>" }
lvim.keys.normal_mode["?"] = ":WhichKey<cr>"

-- Use H and L to navigate tabs.
lvim.keys.normal_mode["<S-h>"] = "gT"
lvim.keys.normal_mode["<S-l>"] = "gt"

-- Configure hop.
vim.api.nvim_set_keymap("n", "\\", ":HopWord<cr>", { silent = true })
