-- Telescope fuzzy finder
dofile(vim.g.base46_cache .. "telescope")

return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope-ui-select.nvim",
  },
  cmd = "Telescope",
  opts = {
    defaults = {
      prompt_prefix = " 🔍 ",
      selection_caret = " ",
      entry_prefix = " ",
      sorting_strategy = "ascending",
      layout_config = {
        horizontal = {
          prompt_position = "top",
          preview_width = 0.55,
        },
        width = 0.95,
        height = 0.95,
      },
      mappings = {
        i = {
          ["<C-j>"] = require("telescope.actions").move_selection_next,
          ["<C-k>"] = require("telescope.actions").move_selection_previous,
          ["<C-S-j>"] = require("telescope.actions").cycle_history_next,
          ["<C-S-k>"] = require("telescope.actions").cycle_history_prev,
        },
        n = {
          ["q"] = require("telescope.actions").close,
        },
      },
    },
    pickers = {
      git_commits = {
        attach_mappings = function(_, map)
          map({ 'i', 'n' }, '<A-u>', function(prompt_bufnr)
            -- Soft reset to selected commit
            local actions = require("telescope.actions")
            local state = require("telescope.actions.state")
            local entry = state.get_selected_entry()
            local commit_hash = entry and (entry.value or entry.sha or entry.commit)

            if not commit_hash then
              vim.notify("No commit selected.", vim.log.levels.WARN)
              return
            end

            actions.close(prompt_bufnr)
            vim.cmd("G reset --soft " .. commit_hash)
            vim.notify("Fugitive: Git soft reset to " .. commit_hash, vim.log.levels.INFO)
          end)
          return true
        end,
      },
      git_status = {
        attach_mappings = function(_, map)
          map({ 'i', 'n' }, '<A-c>', function(prompt_bufnr)
            -- Open Git commit window
            local actions = require("telescope.actions")
            actions.close(prompt_bufnr)
            vim.cmd("vert G commit | startinsert")
          end)
          return true
        end,
      },
    },
    extensions = {
      ["ui-select"] = {
        require("telescope.themes").get_dropdown({}),
      },
    },
  },
  config = function(_, opts)
    local telescope = require("telescope")
    telescope.setup(opts)

    -- Load NvChad extensions
    telescope.load_extension("themes")
    telescope.load_extension("terms")

    -- Load ui-select for CopilotChat integration
    telescope.load_extension("ui-select")
  end,
  keys = {
    -- Find commands
    { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find files" },
    { "<leader>fw", "<cmd>Telescope live_grep<cr>", desc = "Find by grep" },
    { "<leader>fs", "<cmd>Telescope grep_string<cr>", desc = "Find word under cursor" },
    { "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Find buffers" },
    { "<leader>fh", "<cmd>Telescope help_tags<cr>", desc = "Find help" },
    { "<leader>fr", "<cmd>Telescope oldfiles<cr>", desc = "Find recent files" },
    { "<leader>fc", "<cmd>Telescope commands<cr>", desc = "Find commands" },
    { "<leader>fk", "<cmd>Telescope keymaps<cr>", desc = "Find keymaps" },
    { "<leader>fd", "<cmd>Telescope diagnostics<cr>", desc = "Find diagnostics" },
    { "<leader>ft", "<cmd>Telescope themes<cr>", desc = "Find theme" },

    -- Git commands
    { "<leader>fgb", "<cmd>Telescope git_branches<cr>", desc = "Git branches" },
    { "<leader>fgc", "<cmd>Telescope git_commits<cr>", desc = "Git commits" },
    { "<leader>fgs", "<cmd>Telescope git_status<cr>", desc = "Git status" },
    { "<leader>fgS", "<cmd>Telescope git_stash<cr>", desc = "Git stash" },
  },
}
