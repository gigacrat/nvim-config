return {
  "CopilotC-Nvim/CopilotChat.nvim",
  branch = "main",
  dependencies = {
    { "zbirenbaum/copilot.lua" },
    { "nvim-lua/plenary.nvim" },
    { "nvim-telescope/telescope.nvim" },
  },
  opts = {
    debug = false,
    show_help = false,
    show_folds = false, -- Enable folds for better organization
    auto_insert_mode = true, -- Jump to insert mode when opening

    window = {
      layout = "vertical", -- 'vertical', 'horizontal', 'float'
      -- width = 0.4, -- Managed by aperture
    },

    mappings = {
      -- Reset chat
      reset = {
        normal = "<C-S-l>",
        insert = "<C-S-l>",
      },

      -- Diff operations
      accept_diff = {
        normal = "<C-y>",
        insert = "<C-y>",
      },

      jump_to_diff = {
        normal = "gj",
      },

      yank_diff = {
        normal = "gy",
        register = "+", -- Yank to system clipboard
      },

      show_diff = {
        normal = "gd",
      },

      show_info = {
        normal = "gi",
      },

      show_help = {
        normal = "g?",
      },
    },
  },
  keys = {
    -- Telescope picker for AI prompts
    {
      "<leader>ap",
      "<cmd>CopilotChatPrompts<cr>",
      mode = { "n", "v" },
      desc = "AI - Prompts/actions",
    },
    -- Toggle chat window
    {
      "<leader>aa",
      "<cmd>CopilotChatToggle<cr>",
      desc = "AI - Toggle chat",
      mode = { "n", "v" },
    },
    -- Explain code
    {
      "<leader>ae",
      "<cmd>CopilotChatExplain<cr>",
      mode = { "n", "v" },
      desc = "AI - Explain code",
    },
    -- Review code
    {
      "<leader>ar",
      "<cmd>CopilotChatReview<cr>",
      mode = { "n", "v" },
      desc = "AI - Review code",
    },
    -- Fix code
    {
      "<leader>af",
      "<cmd>CopilotChatFix<cr>",
      mode = { "n", "v" },
      desc = "AI - Fix code",
    },
    -- Optimize code
    {
      "<leader>ao",
      "<cmd>CopilotChatOptimize<cr>",
      mode = { "n", "v" },
      desc = "AI - Optimize code",
    },
    -- Generate docs
    {
      "<leader>ad",
      "<cmd>CopilotChatDocs<cr>",
      mode = { "n", "v" },
      desc = "AI - Generate docs",
    },
    -- Generate tests
    {
      "<leader>at",
      "<cmd>CopilotChatTests<cr>",
      mode = { "n", "v" },
      desc = "AI - Generate tests",
    },
    -- Clear/reset chat
    {
      "<leader>ax",
      "<cmd>CopilotChatReset<cr>",
      mode = { "n", "v" },
      desc = "AI - Clear chat",
    },
  },
}
