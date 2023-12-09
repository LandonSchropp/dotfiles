local starts_with = require("user.utilities.string").starts_with

local UI_PREFIX = "<leader>u"
local MAPPINGS_TO_KEEP = { "<leader>ui", "<leader>uS", "<leader>uh", "<leader>uw" }

return function(mappings)
  local updated_mappings = { n = {} }

  -- Remove UI mappings
  for key, _ in pairs(mappings.n) do
    if starts_with(key, UI_PREFIX) and not vim.tbl_contains(MAPPINGS_TO_KEEP, key) then
      updated_mappings.n[key] = false
    end
  end

  -- Add mappings
  updated_mappings.n["<leader>uc"] = { ":Copilot toggle<cr>", desc = "Toggle Copilot" }

  return updated_mappings
end
