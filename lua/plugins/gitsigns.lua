return {
  "lewis6991/gitsigns.nvim",
  event = { "BufReadPre", "BufNewFile" },
  opts = {
    signs = {
      add = { text = "▌" },
      change = { text = "▌" },
      delete = { text = "▌" },
      topdelete = { text = "▌" },
      changedelete = { text = "▌" },
      untracked = { text = "▌" },
    },
    signs_staged = {
      add          = { text = '▎' },
      change       = { text = '▎' },
      delete       = { text = '▎' },
      topdelete    = { text = '▎' },
      changedelete = { text = '▎' },
      untracked    = { text = '▎' },
    },
    signcolumn = true, -- Display signs in the sign column
    numhl = false, -- Highlight line number for changed lines
    linehl = false, -- Highlight entire line for changed lines
    word_diff = false, -- Highlight word differences
    attach_to_untracked = true, -- Attach to untracked files
    current_line_blame = false, -- Show blame info for the current line
    current_line_blame_opts = {
      virt_text = true,
      virt_text_pos = "eol",
      delay = 1000,
      ignore_whitespace = false,
    },
    preview_config = {
      border = "rounded",
      style = "minimal",
      relative = "cursor",
      row = 0,
      col = 1,
    },
  },
  keys = {
    -- Navigation
    {
      "]g",
      function()
        if vim.wo.diff then
          return "]c"
        end
        require("gitsigns").nav_hunk("next")
        return "<Ignore>" -- prevent the key from being processed further
      end,
      expr = true,
      desc = "Next git hunk",
      mode = { "n", "v" },
    },
    {
      "[g",
      function()
        if vim.wo.diff then
          return "[c"
        end
        require("gitsigns").nav_hunk("prev")
        return "<Ignore>" -- prevent the key from being processed further
      end,
      expr = true,
      desc = "Previous git hunk",
      mode = { "n", "v" },
    },

    -- Hunk operations
    {
      "<leader>gs",
      function()
        local gs = require("gitsigns")
        local mode = vim.fn.mode()
        if mode == "V" or mode == "v" then
          local start = vim.fn.line("v")
          local finish = vim.fn.line(".")
          gs.stage_hunk({ math.min(start, finish), math.max(start, finish) })
        else
          gs.stage_hunk()
        end
        -- HACK: On Windows, Gitsigns signcolumn doesn't update automatically
        -- Here we force a write to trigger the signcolumn update
        if vim.has("win32") == 1 then
          vim.cmd("write")
        end
      end,
      desc = "Stage hunk",
      mode = { "n", "v" }
    },
    {
      "<leader>gr",
      function()
        local gs = require("gitsigns")
        local mode = vim.fn.mode()
        if mode == "V" or mode == "v" then
          local start = vim.fn.line("v")
          local finish = vim.fn.line(".")
          gs.reset_hunk({ math.min(start, finish), math.max(start, finish) })
        else
          gs.reset_hunk()
        end
      end,
      desc = "Reset hunk",
      mode = { "n", "v" }
    },
    { "<leader>gS", "<cmd>Gitsigns stage_buffer<CR>",    desc = "Stage buffer" },
    { "<leader>gR", "<cmd>Gitsigns reset_buffer<CR>",    desc = "Reset buffer" },
    { "<leader>gp", "<cmd>Gitsigns preview_hunk<CR>",    desc = "Preview hunk" },
    { "<leader>gb", "<cmd>Gitsigns blame_line<CR>",      desc = "Blame line" },
    { "<leader>gd", "<cmd>Gitsigns diffthis<CR>",        desc = "Diff this" },
    {
      "<leader>gD",
      function()
        require("gitsigns").diffthis("~")
      end,
      desc = "Diff this ~",
    },

    -- Toggle options
    { "<leader>gt",  group = "Toggle" },
    { "<leader>gtb", "<cmd>Gitsigns toggle_current_line_blame<CR>", desc = "Toggle line blame" },
    { "<leader>gtd", "<cmd>Gitsigns toggle_deleted<CR>",            desc = "Toggle deleted" },
  },
}
