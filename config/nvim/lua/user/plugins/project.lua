-- Automatically change into project root directories.
return {
  "ahmedkhalf/project.nvim",
  opts = {
    -- Display a message when changing the project root.
    silent_chdir = false,

    -- Don't change to child packages in monorepos.
    exclude_dirs = { "packages/*", "plugins/*" },
  },
  config = function(_, options)
    require("project_nvim").setup(options)
  end,
}
