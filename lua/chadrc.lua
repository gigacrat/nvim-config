-- NvChad configuration for base46 theming
local options = {
  base46 = {
    theme = "nightscape_rc2", -- default theme
    hl_add = {
      StatusLineNC = { bg = "darker_black" },
      CursorLineNr = { fg = "blue" },
    },
    hl_override = {
      -- Statusline overrides
      St_NormalMode = { bg = "blue" },
      St_NormalModeSep = { fg = "blue" },
      St_InsertMode = { bg = "yellow" },
      St_InsertModeSep = { fg = "yellow" },
      St_VisualMode = { bg = "orange" },
      St_VisualModeSep = { fg = "orange" },
      NormalFloat = { bg = "base00" },
      Normal = { bg = "none" },
      Visual = { bg = "black2" },
      TbFill = { bg = "base00" },
      WinBarNC = { bg = "darker_black", fg = "white" },
      WinBar = { bg = "darker_black", fg = "white" },
    },
    integrations = {},
    transparency = false,
    theme_toggle = { "onedark", "one_light" },
  },
  ui = {
    cmp = {
      icons_left = false,
      style = "default", -- default/flat_light/flat_dark/atom/atom_colored
      abbr_maxwidth = 60,
      format_colors = { lsp = true, icon = "󱓻" },
    },
    term = {
      base46_colors = true,
      float = {
        relative = "editor",
        row = 0.1,
        col = 0.1,
        width = 0.8,
        height = 0.8,
        border = "single",
      },
    },

    telescope = { style = "bordered" },

    statusline = {
      enabled = true,
      theme = "default",
      separator_style = "default",
      order = nil,
      modules = nil,
    },

    tabufline = {
      enabled = false,
    },
  },

  nvdash = {
    enabled = false,
  },

  colorify = {
    enabled = true,
    mode = "bg",
  },

  lsp = { signature = true },

  cheatsheet = {
    theme = "grid",
    excluded_groups = { "terminal (t)", "autopairs", "Nvim", "Opens" },
  },
}

-- NvChad terminal mappings
vim.keymap.set({"n", "t"}, "<A-v>", function()
  require("nvchad.term").toggle({ pos = "bo vsp", id = "vTerm", })
end, { desc = "Toggle vertical terminal" })

vim.keymap.set({"n", "t"}, "<A-h>", function()
  require("nvchad.term").toggle({ pos = "bo sp", id = "hTerm" })
end, { desc = "Toggle horizontal terminal" })

vim.keymap.set({"n", "t"}, "<A-f>", function()
  -- Manually passing float_opts because nvchad config doesn't seem to apply them automatically
  require("nvchad.term").toggle({
    pos = "float",
    id = "fTerm",
    float_opts = {
      relative = "editor",
      row = 0.05,
      col = 0.1,
      width = 0.8,
      height = 0.8,
      border = "single",
    }
  })
end, { desc = "Toggle floating terminal" })

return options
