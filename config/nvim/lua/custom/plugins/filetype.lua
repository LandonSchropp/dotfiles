return {
  config = function()
    require("filetype").setup({
      overrides = {
        literal = {
          [".babelrc"] = "json",
          Procfile = "json",
          [".envrc"] = "sh",
        }
      }
    })
  end
}
