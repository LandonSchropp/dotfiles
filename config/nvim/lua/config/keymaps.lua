local keymap_utils = require("util.keymaps")

-- Remap built-in keybindings that I don't like.
keymap_utils.remap_nvim("n", "<leader>l", "<leader>L", { desc = "Open Lazy.nvim" })
keymap_utils.remap_nvim("n", "<leader>gg", "<leader>gg", { desc = "Lazygit" })

-- Delete the keymaps I don't like or don't use.
vim.keymap.del("n", "<c-s>")
vim.keymap.del("n", "<leader>-")
vim.keymap.del("n", "<leader><tab><tab>")
vim.keymap.del("n", "<leader><tab>[")
vim.keymap.del("n", "<leader><tab>]")
vim.keymap.del("n", "<leader><tab>d")
vim.keymap.del("n", "<leader><tab>f")
vim.keymap.del("n", "<leader><tab>l")
vim.keymap.del("n", "<leader>`")
vim.keymap.del("n", "<leader>bb")
vim.keymap.del("n", "<leader>fT")
vim.keymap.del("n", "<leader>fn")
vim.keymap.del("n", "<leader>ft")
vim.keymap.del("n", "<leader>gG")
vim.keymap.del("n", "<leader>qq")
vim.keymap.del("n", "<leader>uc")
vim.keymap.del("n", "<leader>ud")
vim.keymap.del("n", "<leader>uf")
vim.keymap.del("n", "<leader>ul")
vim.keymap.del("n", "<leader>ur")
vim.keymap.del("n", "<leader>us")
vim.keymap.del("n", "<leader>uw")
vim.keymap.del("n", "<leader>w-")
vim.keymap.del("n", "<leader>wd")
vim.keymap.del("n", "<leader>ww")
vim.keymap.del("n", "<leader>w|")
vim.keymap.del("n", "<leader>xl")
vim.keymap.del("n", "<leader>xq")
vim.keymap.del("n", "<leader>|")
vim.keymap.del("n", "[b")
vim.keymap.del("n", "]b")

-- Prevent the cursor from jumping when joining lines
vim.keymap.set("n", "J", "mzJ`z", { desc = "Join" })

-- Create more convenient mappings for yanking to and pasting from the system clipboard.
vim.keymap.set("n", "gy", '"*y', { desc = "Yank to system clipboard" })
vim.keymap.set("n", "gp", '"*p', { desc = "Paste from system clipboard" })
vim.keymap.set("n", "gY", '"*y$', { desc = "Yank until end of line to system clipboard" })
vim.keymap.set("v", "gy", '"*y', { desc = "Yank to system clipboard" })
vim.keymap.set("v", "gp", '"*p', { desc = "Paste from system clipboard" })

-- Set up save and close buffer commands.
vim.keymap.set("n", "W", "<cmd>write<cr>", { desc = "Write buffer" })
vim.keymap.set("n", "Z", "WX", { desc = "Write and close buffer" })

-- Add buffer yank helper.
vim.keymap.set("n", "<leader>by", "<cmd>let @+=expand('%:p')<cr>", { desc = "Yank buffer path" })
