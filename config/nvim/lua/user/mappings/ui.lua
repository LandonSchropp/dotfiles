local starts_with = require("user.utilities.string").starts_with

local UI_PREFIX = "<leader>u"
local MAPPINGS_TO_KEEP = { "<leader>ui", "<leader>uS", "<leader>uh", "<leader>uw", "<leader>un" }

return function(mappings)
  local updated_mappings = { n = {} }

  -- Remove UI mappings
  for key, _ in pairs(mappings.n) do
    if
        key ~= UI_PREFIX
        and starts_with(key, UI_PREFIX)
        and not vim.tbl_contains(MAPPINGS_TO_KEEP, key)
    then
      updated_mappings.n[key] = false
    end
  end

  -- Add mappings
  updated_mappings.n["<leader>uc"] = { ":Copilot toggle<cr>", desc = "Toggle Copilot" }
  updated_mappings.n["<leader>ue"] = { ":Neotree toggle<cr>", desc = "Toggle Explorer" }

  return updated_mappings
end
