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
      "<leader>tt",
      function()
        vim.cmd("write")
        require("neotest").run.run()
      end,
      desc = "Run nearest test",
    },
    {
      "<leader>td",
      function()
        vim.cmd("write")
        require("neotest").run.run({ strategy = "dap" })
      end,
      desc = "Debug nearest test",
    },
    {
      "<leader>ta",
      function()
        vim.cmd("write")
        require("neotest").run.attach()
      end,
      desc = "Attach to nearest test",
    },
    {
      "<leader>tf",
      function()
        vim.cmd("write")
        require("neotest").run.run(vim.fn.expand("%"))
      end,
      desc = "Run file",
    },
    {
      "<leader>ts",
      function()
        require("neotest").summary.open()
      end,
      desc = "Open test summary",
    },
    {
      "<leader>tS",
      function()
        require("neotest").run.stop()
      end,
      desc = "Stop the nearest test",
    },
    {
      "<leader>to",
      function()
        require("neotest").output.open()
      end,
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
