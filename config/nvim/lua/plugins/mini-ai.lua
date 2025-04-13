---@module "lazy"

---@type LazySpec
return {
  "echasnovski/mini.ai",
  opts = function(_, opts)
    local deep_extend = require("utilities.table").deep_extend
    local gen_spec_pair = require("mini.ai").gen_spec.pair

    -- Add custom text objects to match `a` and `i` commands like `ci_`, `da-`, `ci<space>`, etc.
    return deep_extend(opts, {
      custom_textobjects = {
        ["_"] = gen_spec_pair("_", "_"),
        ["-"] = gen_spec_pair("-", "-"),
        [" "] = gen_spec_pair(" ", " ", { type = "greedy" }),
      },
    })
  end,
}
