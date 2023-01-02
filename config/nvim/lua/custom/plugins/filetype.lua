return {
  config = function()
    require("filetype").setup({
      overrides = {
        literal = {
          [".babelrc"] = "json",
          Procfile = "json",
          [".envrc"] = "sh",
          gitconfig = "gitconfig",
          Guardfile = "ruby",
          zprofile = "zsh",
        }
      }
    })
  end
}
