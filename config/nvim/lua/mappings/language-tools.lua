local function next_diagnostic()
  vim.diagnostic.jump({ count = 1, float = true })
end

local function previous_diagnostic()
  vim.diagnostic.jump({ count = -1, float = true })
end

return function(_)
  return {
    n = {
      ["]]"] = { next_diagnostic, desc = "Next diagnostic" },
      ["[["] = { previous_diagnostic, desc = "Previous diagnostic" },
    },
  }
end
