local PREFIX = "<leader>u"

return function(mappings)
  local removed_mappings = { n = {} }

  -- Remove all of the UI mappings.
  for key, _ in pairs(mappings.n) do
    if type(key) == "string" and key:sub(1, #PREFIX) == PREFIX then
      removed_mappings.n[key] = false
    end
  end

  return removed_mappings
end
