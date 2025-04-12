local function generate_documentation()
  require("neogen").generate()
end

local function next_choice()
  local luasnip = require("luasnip")

  if luasnip.choice_active() then
    luasnip.change_choice(1)
  end
end

local function previous_choice()
  local luasnip = require("luasnip")

  if luasnip.choice_active() then
    luasnip.change_choice(-1)
  end
end

local function next_diagnostic()
  vim.diagnostic.jump({ count = 1, float = true })
end

local function previous_diagnostic()
  vim.diagnostic.jump({ count = -1, float = true })
end

return function()
  return {
    n = {
      ["<Leader>ld"] = { generate_documentation, desc = "Generate documentation" },
      ["]]"] = { next_diagnostic, desc = "Next diagnostic" },
      ["[["] = { previous_diagnostic, desc = "Previous diagnostic" },
    },
    i = {
      ["<C-e>"] = { next_choice, desc = "Next choice" },
      ["<C-n>"] = { next_choice, desc = "Next choice" },
      ["<C-p>"] = { previous_choice, desc = "Previous choice" },
    },
  }
end
