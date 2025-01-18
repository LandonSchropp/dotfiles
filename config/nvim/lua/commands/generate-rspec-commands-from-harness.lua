return {
  function()
    -- Replace the dots with slashes
    vim.cmd("silent! % s/\\./\\//g")

    -- Remove duplicate lines
    vim.cmd("silent! sort u")

    -- Remove empty lines
    vim.cmd("silent! %s/^s*\\n//g")

    -- Add a `.rb` file extension to every line.
    vim.cmd("silent! %s/$/.rb/g")

    -- Prepend every line with `be rspec`
    vim.cmd("silent! %s/^/be rspec /g")
  end,
  desc = "Converts Harness test names into a list of commands to run each file",
}
