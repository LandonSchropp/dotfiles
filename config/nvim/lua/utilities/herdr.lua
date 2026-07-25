local M = {}

--- @return string|nil The label of the current herdr tab, or nil if not running inside herdr.
function M.get_current_tab()
  local tab_id = vim.env.HERDR_TAB_ID

  if not tab_id then
    return nil
  end

  local output = vim.fn.system("herdr tab get " .. vim.fn.shellescape(tab_id))

  if vim.v.shell_error ~= 0 then
    return nil
  end

  local success, response = pcall(vim.json.decode, output)

  if not success then
    return nil
  end

  return vim.tbl_get(response, "result", "tab", "label")
end

return M
