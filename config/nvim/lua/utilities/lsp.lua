local M = {}

function M.is_lsp_client_active(client_name)
  local clients = vim.lsp.get_clients({ bufnr = 0 })

  for _, client in ipairs(clients) do
    if client.name == client_name then
      return true
    end
  end

  return false
end

return M
