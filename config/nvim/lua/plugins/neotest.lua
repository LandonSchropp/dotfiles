---@module "lazy"

local function run_nearest_test()
  vim.cmd("write")
  require("neotest").run.run()
end

local function debug_nearest_test()
  vim.cmd("write")
  require("neotest").run.run({ strategy = "dap" })
end

local function attach_to_nearest_test()
  vim.cmd("write")
  require("neotest").run.attach()
end

local function run_file()
  vim.cmd("write")
  require("neotest").run.run(vim.fn.expand("%"))
end

local function open_test_summary()
  require("neotest").summary.open()
end

local function stop_nearest_test()
  require("neotest").run.stop()
end

local function open_test_output()
  require("neotest").output.open()
end

---@type LazySpec
return {
  "nvim-neotest/neotest",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
    "antoinemadec/FixCursorHold.nvim",
    "olimorris/neotest-rspec",
    "haydenmeade/neotest-jest",
    "jfpedroza/neotest-elixir",
  },
  keys = {
    {
      "<Leader>tt",
      run_nearest_test,
      desc = "Run nearest test",
    },
    {
      "<Leader>td",
      debug_nearest_test,
      desc = "Debug nearest test",
    },
    {
      "<Leader>ta",
      attach_to_nearest_test,
      desc = "Attach to nearest test",
    },
    {
      "<Leader>tf",
      run_file,
      desc = "Run file",
    },
    {
      "<Leader>ts",
      open_test_summary,
      desc = "Open test summary",
    },
    {
      "<Leader>tS",
      stop_nearest_test,
      desc = "Stop the nearest test",
    },
    {
      "<Leader>to",
      open_test_output,
      desc = "Open test output",
    },
  },
  config = function()
    require("neotest").setup({
      adapters = {
        require("neotest-rspec"),
        require("neotest-elixir"),
        require("neotest-jest")({}),
      },
    })
  end,
}
