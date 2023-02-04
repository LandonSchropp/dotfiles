-- Automatically change into project root directories.
return {
  "ahmedkhalf/project.nvim",
  config = function()
    require("project_nvim").setup({
      -- Don't change into subdirectories in monorepos.
      exclude_dirs = { "packages/*", "plugins/*" },
    })
  end,
}
