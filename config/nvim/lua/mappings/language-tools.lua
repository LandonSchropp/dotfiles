local extend = require("utilities.table").extend

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

return function(_)
  return {
    n = {
      ["<Leader>ld"] = { generate_documentation, desc = "Generate documentation" },
    },
    i = {
      ["<C-e>"] = { next_choice, desc = "Next choice" },
      ["<C-n>"] = { next_choice, desc = "Next choice" },
      ["<C-p>"] = { previous_choice, desc = "Previous choice" },
    },
  }
end
