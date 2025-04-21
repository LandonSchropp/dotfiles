local function flash_jump()
  require("flash").jump()
end

local function flash_treesitter()
  require("flash").jump()
end

return {
  "folke/flash.nvim",
  event = "VeryLazy",
  keys = {
    { "\\", flash_jump,       desc = "Flash",           mode = { "n", "x", "o" } },
    { "|",  flash_treesitter, desc = "Flash Tresitter", mode = { "n", "x", "o" } },
  },
  opts = {},
}
