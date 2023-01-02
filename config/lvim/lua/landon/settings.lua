local telescope = require("telescope")

-- Improve the Telescope display.
lvim.builtin.telescope.defaults.layout_config.width = 0.999999
lvim.builtin.telescope.defaults.path_display = { "truncate" }

-- Improve the Telescope sorting algorithm.
telescope.load_extension("fzf")
