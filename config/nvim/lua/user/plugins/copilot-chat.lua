return {
  "CopilotC-Nvim/CopilotChat.nvim",
  opts = {
    show_help = "yes",
    debug = false,
    disable_extra_info = "no",
  },
  build = function()
    vim.notify(
      "Please update the remote plugins by running ':UpdateRemotePlugins', then restart Neovim."
    )
  end,
  event = "VeryLazy",
  keys = {
    {
      "<leader>cb",
      ":CopilotChatBuffer ",
      desc = "Chat with current buffer",
    },
    { "<leader>ce", "<cmd>CopilotChatExplain<cr>", desc = "Explain code" },
    { "<leader>ct", "<cmd>CopilotChatTests<cr>", desc = "Generate tests" },
    {
      "<leader>cT",
      "<cmd>CopilotChatVsplitToggle<cr>",
      desc = "Toggle vertical split",
    },
    {
      "<leader>cv",
      ":CopilotChatVisual ",
      mode = "x",
      desc = "Open vertical split",
    },
    {
      "<leader>cx",
      ":CopilotChatInPlace<cr>",
      mode = "x",
      desc = "Run in-place code",
    },
    {
      "<leader>cf",
      "<cmd>CopilotChatFixDiagnostic<cr>", -- Get a fix for the diagnostic message under the cursor.
      desc = "Fix diagnostic",
    },
    {
      "<leader>cr",
      "<cmd>CopilotChatReset<cr>", -- Reset chat history and clear buffer.
      desc = "Reset chat and buffer",
    },
  },
}
