-- Telescope fuzzy finder
dofile(vim.g.base46_cache .. "telescope")

-- The empty unnamed buffer nvim starts with. `:edit` would reuse it, but
-- switching buffers directly leaves it stranded in the buffer list.
local function is_startup_scratch(bufnr)
  if not vim.api.nvim_buf_is_valid(bufnr) then
    return false
  end

  local lines = vim.api.nvim_buf_get_lines(bufnr, 0, -1, false)

  return vim.api.nvim_buf_get_name(bufnr) == ""
    and vim.bo[bufnr].buftype == ""
    and not vim.bo[bufnr].modified
    and #lines <= 1
    and (lines[1] or "") == ""
    and #vim.fn.win_findbuf(bufnr) == 0
end

-- Open every entry marked with <Tab>. Telescope's built-in <CR> only ever
-- opens the entry under the cursor and drops the rest of the selection.
local function open_selected(prompt_bufnr)
  local actions = require("telescope.actions")
  local state = require("telescope.actions.state")

  local picker = state.get_current_picker(prompt_bufnr)
  local targets = {}

  for _, entry in ipairs(picker:get_multi_selection()) do
    local bufnr = entry.bufnr

    if not bufnr then
      -- Only path/filename count as files; pickers like git_commits and
      -- commands leave both nil, so they fall through to the default action.
      local path = entry.path or entry.filename
      if path and path ~= "" and vim.fn.isdirectory(path) == 0 then
        bufnr = vim.fn.bufadd(vim.fn.fnamemodify(path, ":p"))
      end
    end

    if bufnr then
      table.insert(targets, { bufnr = bufnr, lnum = entry.lnum, col = entry.col })
    end
  end

  -- Nothing marked, or nothing marked was a file
  if #targets == 0 then
    return actions.select_default(prompt_bufnr)
  end

  actions.close(prompt_bufnr)

  -- Closing restores the window we came from, so this is the buffer that was
  -- current before the picker opened
  local origin = vim.api.nvim_get_current_buf()

  -- Load, don't just list: CopilotChat's #buffers context filters on
  -- nvim_buf_is_loaded, so unloaded buffers never reach the chat.
  for _, target in ipairs(targets) do
    vim.bo[target.bufnr].buflisted = true
    vim.fn.bufload(target.bufnr)
  end

  -- Land on the first file marked, the rest wait in the buffer list
  local first = targets[1]
  vim.api.nvim_set_current_buf(first.bufnr)
  if first.lnum then
    pcall(vim.api.nvim_win_set_cursor, 0, { first.lnum, (first.col or 1) - 1 })
  end

  if origin ~= first.bufnr and is_startup_scratch(origin) then
    pcall(vim.api.nvim_buf_delete, origin, { force = false })
  end
end

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
          ["<CR>"] = open_selected,
          ["<C-j>"] = require("telescope.actions").move_selection_next,
          ["<C-k>"] = require("telescope.actions").move_selection_previous,
          ["<C-S-j>"] = require("telescope.actions").cycle_history_next,
          ["<C-S-k>"] = require("telescope.actions").cycle_history_prev,
        },
        n = {
          ["<CR>"] = open_selected,
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

    -- Search commands
    { "<leader>sr", "<cmd>Telescope resume<cr>", desc = "Resume last search" },

    -- Git commands
    { "<leader>fgb", "<cmd>Telescope git_branches<cr>", desc = "Git branches" },
    { "<leader>fgc", "<cmd>Telescope git_commits<cr>", desc = "Git commits" },
    { "<leader>fgs", "<cmd>Telescope git_status<cr>", desc = "Git status" },
    { "<leader>fgS", "<cmd>Telescope git_stash<cr>", desc = "Git stash" },
  },
}
