local starts_with = require("utilities.string").starts_with

local PREFIX = "<Leader>s"

return function(mappings)
  local updated_mappings = { n = {} }

  -- Remove Search/Replace mappings
  for key, _ in pairs(mappings.n) do
    if key ~= PREFIX and starts_with(key, PREFIX) then
      updated_mappings.n[key] = false
    end
  end

  return updated_mappings
end
