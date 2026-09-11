local M = {}

M.base_30 = {
  -- Neutral ramp, locked at OKLCh hue 240, AI Assisted
  darker_black    = "#010A14", -- floats, sidebars
  black           = "#01111D", -- bg
  lighter_black   = "#021929", -- floats, sidebars
  black2          = "#022439", -- cursorline
  one_bg          = "#02304A", -- statusline icon fg
  one_bg2         = "#003C5C", -- selection background
  one_bg3         = "#01496E", -- borders

  -- Foreground Ramp, linear blend from one_bg3 to bright_white, locked at hue 240
  grey            = "#2A6286", -- line numbers, scrollbars
  grey_fg         = "#4E7C9D", -- comments
  grey_fg2        = "#7197B2", -- unused placeholder
  light_grey      = "#94B1C6", -- fg (inactive text)
  light_white     = "#B7CCDC", -- fg (normal text)
  white           = "#DAE7F1",

  -- Neutral aliases
  line            = "#01496E", -- vertsplit and other rules;
  lightbg         = "#02304A", -- statusline sections
  statusline_bg   = "#021929", -- tracks darker_black

  -- OKLCH hue spectrum based on 00AEFF
  red             = "#F97378",
  orange          = "#F38034",
  yellow          = "#D89500",
  vibrant_green   = "#8CB42A",
  green           = "#00C27F",
  teal            = "#00C1A7",
  cyan            = "#00BAD5",
  blue            = "#00AEFF",
  nord_blue       = "#7C9BFF",
  purple          = "#B488FA",
  pink            = "#E576C3",

  dark_purple     = "#4974FF", -- monochromatic shift from nord_blue

  highlight       = "#FEB001", -- max chroma max brightness yellow via OKLCh

  sun             = "#E6C48C",
  pmenu_bg        = "#98D1FA", -- blue @ 50% chroma, +0.12 lightness via OKLCh
  folder_bg       = "#98D1FA",
  baby_pink       = "#EFB5DA",

  brownred        = "#321717", -- red @ 20% brightness value via HSL, shifted to 20 hue via OKLCh
  darkyellow      = "#2b1e05", -- brownred shifted to 80 hue via OKLCh
  darkgreen       = "#0a2619", -- brownred shifted to 160 hue via OKLCh
  darkhighlight   = "#432b02", -- highlight @ 25% brightness value via HSL, then hue-aligned via OKLCh
}

---@type Base16Table
M.base_16 = {
  base00 = M.base_30.black,        -- Neovim Default Background
  base01 = M.base_30.one_bg,       -- Lighter Background (Used for status bars, line number and folding marks)
  base02 = M.base_30.one_bg2,      -- Selection Background (Visual Mode)
  base03 = M.base_30.one_bg3,      -- Comments, Invisibles, Line Highlighting
  base04 = M.base_30.grey_fg,      -- Dark Foreground, Dnf Underline (Used for status bars)
  base05 = M.base_30.white,        -- Default Foreground
  base06 = M.base_30.light_white,  -- Light Foreground (Not often used)
  base07 = M.base_30.light_grey,   -- Light Foreground, Cmp Icons (Not often used)
  base08 = M.base_30.blue,         -- Variables, Identifiers, Filed, Name Space
  base09 = M.base_30.orange,       -- Integers, Boolean, Constants
  base0A = M.base_30.green,        -- Classes, Attribute, Type, Repeat
  base0B = M.base_30.sun,          -- Strings, Symbols, Inherited Class
  base0C = M.base_30.purple,       -- Constructor, Special (regex, string escapes)
  base0D = M.base_30.dark_purple,  -- Functions, Methods, Attribute IDs, Headings
  base0E = M.base_30.pink,         -- Keywords, Storage, Selector
  base0F = M.base_30.grey_fg2,     -- Delimiters, Brackets, Special Char, Deprecated
}

M.polish_hl = {
  defaults = {
    WinBarNC = { bg = M.base_30.lighter_black, fg = M.base_30.white },
    WinBar = { bg = M.base_30.lighter_black, fg = M.base_30.white },
    CursorLineNr = { fg = M.base_30.sun },
  },

  telescope = {
    TelescopeMatching = { bg = M.base_30.darkhighlight, fg = M.base_30.highlight },
    TelescopeSelection = { fg = "none" },
  },

  treesitter = {
    -- base46 routes these three to base0A (types). Keep every keyword on one color.
    ["@keyword.repeat"] = { fg = M.base_30.pink },
    ["@keyword.storage"] = { fg = M.base_30.pink },
    ["@keyword.directive"] = { fg = M.base_30.pink },
  },

  statusline = {
    St_NormalMode = { bg = M.base_30.blue },
    St_NormalModeSep = { fg = M.base_30.blue },
    St_InsertMode = { bg = M.base_30.yellow },
    St_InsertModeSep = { fg = M.base_30.yellow },
    St_VisualMode = { bg = M.base_30.orange },
    St_VisualModeSep = { fg = M.base_30.orange },
    St_cwd_icon = { fg = M.base_30.black2 },
    St_pos_icon = { fg = M.base_30.black2 },
  },

  git = {
    DiffNewFile = { fg = M.base_30.pmenu_bg },
    DiffAdd = { bg = M.base_30.darkgreen, fg = M.base_30.green },
    DiffAdded = { bg = M.base_30.darkgreen, fg = M.base_30.green },
    DiffDelete = { bg = M.base_30.brownred, fg = M.base_30.red },
    DiffRemoved = { bg = M.base_30.brownred, fg = M.base_30.red },
    DiffChangeDelete = { bg = M.base_30.brownred, fg = M.base_30.red },
    DiffChange = { bg = M.base_30.darkyellow, fg = M.base_30.yellow },
    DiffChanged = { bg = M.base_30.darkyellow, fg = M.base_30.yellow },
    DiffModified = { bg = M.base_30.darkyellow, fg = M.base_30.yellow },
    DiffText = { fg = M.base_30.yellow, bg = M.base_30.darkyellow },
  },

  syntax = {
    Search = { bg = M.base_30.darkhighlight, fg = M.base_30.highlight },
    IncSearch = { bg = M.base_30.darkhighlight, fg = M.base_30.highlight },
    CurSearch = { bg = M.base_30.highlight, fg = M.base_30.black },
    Substitute = { bg = M.base_30.darkhighlight, fg = M.base_30.highlight },
  },
}

M.type = "dark"

M = require("base46").override_theme(M, "nightscape")

return M
