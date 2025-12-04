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
          -- Nightscape glass ramp centered on black2 = "#0E2A3A"
          black         = "#0B222F", -- slightly darker sibling of black2
          darker_black  = "#081A24", -- deeper glass for gutters / alt bg
          black2        = "#0E2A3A", -- your chosen CursorLine / selection bg

          one_bg        = "#123447", -- 1 step lighter than black2
          one_bg2       = "#174056", -- 2 steps lighter
          one_bg3       = "#1D4F69", -- 3 steps lighter

          grey          = "#3B5566", -- desaturated UI grey, ~40% lighter than black
          grey_fg2      = "#4A6576", -- 1 step lighter than grey
          grey_fg       = "#56728C", -- 2 step lighter (a.k.a. comment blue)
          light_grey    = "#7A96A8", -- soft, readable UI text / subtle borders

          line          = "#102E40", -- line / split color, just above black2
          lightbg       = "#174056", -- Same as one_bg2
          statusline_bg = "#081A24", -- Same as darker_black
          purple        = "#4E8DFF", -- Nightscape hero blue (replaces Dracula purple)
          dark_purple   = "#3B6ED6", -- shaded hero for depth / secondary emphasis
          pmenu_bg      = "#6FA3FF", -- luminous UI hero surface (popup menus)
          folder_bg     = "#6FA3FF", -- same as pmenu_bg
          violet        = "#6FA3FF", -- same as pmenu_bg
          red           = "#e25555",
          yellow        = "#E0A84F",
          green         = "#4FD18B",
        },
        base_16 = {
          base00 = "#061319",
          base08 = "#4E8DFF",
          base0F = "#6F86AD",
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
