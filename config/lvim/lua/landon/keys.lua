local actions = require("telescope.actions")

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
