-- NvChad configuration for base46 theming
local options = {
  base46 = {
    theme = "chadracula-evondev", -- default theme
    hl_add = {
      StatusLineNC = { bg = "darker_black" },
    },
    hl_override = {
      -- Statusline overrides
      St_file = { bg = "black" },
      St_file_sep = { fg = "black" },
      St_EmptySpace = { bg = "black", fg = "black2" },
      St_NormalModeSep = { bg = "black2" },
      St_InsertModeSep = { bg = "black2" },
      St_VisualModeSep = { bg = "black2" },
      St_CommandModeSep = { bg = "black2" },
      St_ReplaceModeSep = { bg = "black2" },
      St_TerminalModeSep = { bg = "black2" },
      St_NTerminalModeSep = { bg = "black2" },
      St_cwd_text = { bg = "black" },
      St_cwd_icon = { fg = "darker_black" },
      St_pos_icon = { fg = "darker_black" },
      St_pos_text = { bg = "black" },
      St_pos_sep = { bg = "black" },
      TelescopeSelection = { fg = "none" },
      NormalFloat = { bg = "base00" },
      Visual = { bg = "black2" },
      TbFill = { bg = "base00" },
      WinBarNC = { bg = "darker_black", fg = "white" },
      WinBar = { bg = "darker_black", fg = "white" },
      PmenuSel = { bg = "light_grey" }, -- used for cmp menus
    },
    integrations = {},
    changed_themes = {
      ['chadracula-evondev'] = {
        base_30 = {
          black = "#102c39", -- base color
          darker_black = "#0e2631", -- 6% darker than black
          black2 = "#143347", -- 6% lighter than black
          one_bg = "#1a4257", -- 10% lighter than black
          one_bg2 = "#1f4a62", -- 6% lighter than one_bg
          one_bg3 = "#24526d", -- 6% lighter than one_bg2
          grey = "#5e7b8a", -- ~40% lighter than black
          grey_fg = "#6b8897", -- 10% lighter than grey
          grey_fg2 = "#71909f", -- 5% lighter than grey
          light_grey = "#7b9aa9", -- 15% lighter than grey
          line = "#23506b", -- 15% lighter than black
          lightbg = "#1f4a62", -- Same as one_bg2
          statusline_bg = "#0e2631", -- Same as darker_black
        },
        base_16 = {
          base00 = "#061319",
        },
      },
    },
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
