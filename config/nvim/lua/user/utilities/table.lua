local M = {}

-- This is a pure wrapper around vim.tbl_extend with the `"force"` option enabled.
M.extend = function(...)
  return vim.tbl_extend("force", {}, ...)
end

-- This is a pure wrapper around vim.tbl_deep_extend with the `"force"` option enabled.
M.deep_extend = function(...)
  return vim.tbl_deep_extend("force", {}, ...)
end

return M
