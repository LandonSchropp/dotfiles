local M = {}

-- Reverses the given table.
M.reverse = function(table)
  local new_table = {}

  for index, value in ipairs(table) do
    new_table[#table - index + 1] = value
  end

  return new_table
end

return M
