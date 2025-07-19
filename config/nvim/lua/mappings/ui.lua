local starts_with = require("utilities.string").starts_with

local UI_PREFIX = "<Leader>u"
local MAPPINGS_TO_KEEP = { "<Leader>ui", "<Leader>uS", "<Leader>uh", "<Leader>uw", "<Leader>un" }

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
  updated_mappings.n["<Leader>uc"] = { ":Copilot toggle<cr>", desc = "Toggle Copilot" }
  updated_mappings.n["<Leader>ue"] = { ":Neotree toggle<cr>", desc = "Toggle Explorer" }
  updated_mappings.n["<Leader>uh"] = { ":Inspect<cr>", desc = "Highlight Group" }
  updated_mappings.n["<Leader>u2"] =
  { "<cmd>ReformatToTwoSpaces<cr>", desc = "Reformat to 2 spaces" }

  return updated_mappings
end
