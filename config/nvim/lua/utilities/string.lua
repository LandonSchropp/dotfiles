local M = {}

M.starts_with = function(string, start)
  return string:sub(1, #start) == start
end

return M
