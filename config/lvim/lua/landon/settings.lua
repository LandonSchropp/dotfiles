-- Customize the dashboard buttons.
lvim.builtin.alpha.dashboard.section.buttons = {
  entries = {
    { "<leader>f", "  Find File", "<CMD>Telescope find_files<CR>" },
    { "<leader>F", "  Find Text", "<CMD>Telescope live_grep<CR>" },
    { "<leader>n", "  New File", "<CMD>ene!<CR>" },
  },
}

-- Configure project.nvim so it doesn't change to subdirectories in monorepos.
table.insert(lvim.builtin.project.detection_methods, 0, "!>packages")
table.insert(lvim.builtin.project.detection_methods, 0, "!>plugins")

local telescope = require("telescope")

-- Improve the Telescope display.
lvim.builtin.telescope.defaults.layout_config.width = 0.999999
lvim.builtin.telescope.defaults.path_display = { "truncate" }

-- Improve the Telescope sorting algorithm.
telescope.load_extension("fzf")
