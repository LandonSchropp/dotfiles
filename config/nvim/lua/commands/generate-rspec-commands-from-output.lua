return {
  function()
    -- Remove the unnecessary test result information
    vim.cmd("silent! % s/:.*//g")
    vim.cmd("silent! % s/\\[.*//g")
    vim.cmd("silent! % s/'//g")
    vim.cmd("silent! % s/\\.\\///g")

    -- Remove duplicate lines
    vim.cmd("silent! sort u")

    -- Remove empty lines
    vim.cmd("silent! %s/^s*\\n//g")

    -- Prepend every line with `be`
    vim.cmd("silent! %s/^/be /g")
  end,
  desc = "Converts RSpec output into a list of commands to run each file",
}
