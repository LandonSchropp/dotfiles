local M = {}

-- This is a pure wrapper around vim.tbl_extend with the `"force"` option enabled.
M.extend = function(...)
  return vim.tbl_extend("force", {}, ...)
end

-- This is a pure wrapper around vim.tbl_deep_extend with the `"force"` option enabled.
M.deep_extend = function(...)
  return vim.tbl_deep_extend("force", {}, ...)
end

-- Joins two list-like tables, returning a new table.
M.concatenate = function(table1, table2)
  local result = {}

  for index = 1, #table1 do
    result[index] = table1[index]
  end

  for index = 1, #table2 do
    result[#table1 + index] = table2[index]
  end

  return result
end

return M
