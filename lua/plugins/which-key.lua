return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
    preset = "modern",
    spec = {
      -- Leader key groups
      { "<leader>f", group = "Find" },
      { "<leader>b", group = "Buffer" },
      { "<leader>a", group = "AI" },
      { "<leader>l", group = "LSP" },
      { "<leader>g", group = "Git" },
      { "<leader>e", group = "Explorer" },
      { "<leader>t", group = "Toggle/Terminal" },
      { "<leader>w", group = "Window" },
      { "<leader>s", group = "Search/Replace" },

      -- LSP navigation keybindings (standard)
      { "gD", desc = "Go to declaration" },
      { "gd", desc = "Go to definition" },
      { "gi", desc = "Go to implementation" },
      { "gr", desc = "References" },
      { "K", desc = "Hover documentation" },
    },
  },
}
