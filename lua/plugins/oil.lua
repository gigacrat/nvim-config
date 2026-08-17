return {
  "stevearc/oil.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  -- Eager despite the keys below: default_file_explorer only takes over
  -- directory buffers (`nvim .`, `:e src/`) if oil loads before they open
  lazy = false,
  keys = {
    {
      "<leader>e",
      function()
        require("oil").open_float()
      end,
      desc = "Toggle file explorer (float)",
    },
    { "<leader>E", "<cmd>Oil<cr>", desc = "Open file explorer at root" },
  },
  config = function()
    require("oil").setup({
      -- Oil will take over directory buffers (e.g. `vim .` or `:e src/`)
      default_file_explorer = true,

      -- Columns to display in oil buffer
      columns = {
        "icon",
        -- "permissions",
        -- "size",
        -- "mtime",
      },

      -- Buffer-local options to use for oil buffers
      buf_options = {
        buflisted = false,
        bufhidden = "hide",
      },

      -- Window-local options to use for oil buffers
      win_options = {
        wrap = false,
        signcolumn = "no",
        cursorcolumn = false,
        foldcolumn = "0",
        spell = false,
        list = false,
        conceallevel = 3,
        concealcursor = "nvic",
      },

      -- Send deleted files to the trash instead of permanently deleting them
      delete_to_trash = false,

      -- Skip the confirmation popup for simple operations
      skip_confirm_for_simple_edits = false,

      -- Selecting a new/moved/renamed file or directory will prompt you to save changes first
      prompt_save_on_select_new_entry = true,

      -- Oil will automatically delete hidden buffers after this delay
      cleanup_delay_ms = 2000,

      -- Keymaps in oil buffer
      keymaps = {
        ["g?"] = "actions.show_help",
        ["<CR>"] = "actions.select",
        ["<C-v>"] = "actions.select_vsplit",
        ["<C-t>"] = "actions.select_tab",
        ["<C-p>"] = "actions.preview",
        ["<C-c>"] = "actions.close",
        ["q"] = "actions.close",
        ["<C-h>"] = "actions.parent",
        ["<C-l>"] = "actions.select",
        ["-"] = "actions.parent",
        ["_"] = "actions.open_cwd",
        ["`"] = "actions.cd",
        ["~"] = "actions.tcd",
        ["gs"] = "actions.change_sort",
        ["gx"] = "actions.open_external",
        ["g."] = "actions.toggle_hidden",
        ["g\\"] = "actions.toggle_trash",
      },

      -- Set to false to disable all of the above keymaps
      use_default_keymaps = true,

      view_options = {
        -- Show files and directories that start with "."
        show_hidden = false,

        -- This function defines what is considered a "hidden" file
        is_hidden_file = function(name, bufnr)
          return vim.startswith(name, ".")
        end,

        -- This function defines what will never be shown, even when `show_hidden` is set
        is_always_hidden = function(name, bufnr)
          return false
        end,

        sort = {
          -- sort order can be "asc" or "desc"
          { "type", "asc" },
          { "name", "asc" },
        },
      },

      -- Configuration for the floating window in oil.open_float
      float = {
        padding = 2,
        max_width = 80,
        max_height = 0.8,
        border = "rounded",
        win_options = {
          winblend = 0,
        },
      },

      -- Configuration for the actions floating preview window
      preview = {
        max_width = 0.9,
        min_width = { 40, 0.4 },
        width = nil,
        max_height = 0.9,
        min_height = { 5, 0.1 },
        height = nil,
        border = "rounded",
        win_options = {
          winblend = 0,
        },
      },

      -- Configuration for the floating progress window
      progress = {
        max_width = 0.9,
        min_width = { 40, 0.4 },
        width = nil,
        max_height = { 10, 0.9 },
        min_height = { 5, 0.1 },
        height = nil,
        border = "rounded",
        minimized_border = "none",
        win_options = {
          winblend = 0,
        },
      },
    })
  end,
}
