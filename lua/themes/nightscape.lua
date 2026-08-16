-- Credits to original theme https://github.com/evondev/evondev-dracula
-- Spiritual descendant of Dracula, reimagined for those who favor blues to purples.

local M = {}

M.base_30 = {
  -- Core gradient for UI foregrounds and backgrounds
  white         = "#cce9fe", -- main foreground (near-white) full saturation: #f5fcff
  darker_black  = "#0b232e", -- deepest accents / gutters / alt bg
  black         = "#061319", -- main background sibling
  black2        = "#052330", -- cursorline / selection bg (wet asphalt under light)

  one_bg        = "#053247", -- 1 step lighter than black2
  one_bg2       = "#04425E", -- 2 steps lighter
  one_bg3       = "#045175", -- 3 steps lighter

  grey          = "#2e6589", -- desaturated UI grey, ~40% lighter than black
  grey_fg       = "#376e93", -- 1 step lighter than grey (comments)
  grey_fg2      = "#40779c", -- 2 steps lighter
  light_grey    = "#4980a5", -- soft, readable UI text / subtle borders

  line          = "#154257", -- split / border line, just above black2

  -- UI backgrounds
  statusline_bg = "#052330",
  lightbg       = "#045175",

  -- UI accent colors
  pmenu_bg      = "#80c2f0",
  folder_bg     = "#80c2f0",

  -- Semantic/Utility colors
  red           = "#e42c47",
  yellow        = "#ffb602",
  green         = "#0cce50",

  -- Cool channel
  dark_purple   = "#8f4ee1",
  purple        = "#8f4ee1",
  violet        = "#4b67f4",
  nord_blue     = "#4b67f4",
  blue          = "#00aeff",
  cyan          = "#00aeff",
  teal          = "#0ac17c",
  vibrant_green = "#0ac17c",

  -- Warm channel
  orange        = "#f38034",
  sun           = "#d9b371",
  baby_pink     = "#e3a2cd",
  pink          = "#e576c3",

  -- Dark utility colors
  darkgreen     = "#073824",
  brownred      = "#321822",
  darkyellow    = "#383414",
}

M.base_16 = {
  -- Background / foreground colors
  base00 = "#061319",               -- main background (asphalt night)
  base01 = M.base_30.one_bg,        -- slightly lighter bg
  base02 = M.base_30.one_bg2,       -- secondary bg
  base03 = M.base_30.one_bg3,       -- tertiary bg / subtle panels
  base04 = M.base_30.grey,          -- mid grey (comments / muted UI)
  base05 = M.base_30.white,         -- main foreground (cool city glow)
  base06 = "#b9d5ea",               -- lighter fg (reflected light)
  base07 = "#a6c2d6",               -- lightest fg (mist-lit highlights)

  -- Syntax highlights
  base08 = M.base_30.blue,          -- variables / primary color
  base09 = M.base_30.orange,        -- literals
  base0A = M.base_30.teal,          -- primitives, buffer search highlight
  base0B = M.base_30.sun,           -- strings
  base0C = M.base_30.purple,        -- brackets / symbols
  base0D = M.base_30.violet,        -- functions / methods / headings
  base0E = M.base_30.pink,          -- keywords
  base0F = M.base_30.grey,
}

M.polish_hl = {
  telescope = {
    TelescopeMatching = { bg = M.base_30.darkyellow, fg = M.base_30.yellow },
    TelescopeSelection = { fg = "none" },
  },

  treesitter = {
    ["@keyword.repeat"] = { fg = M.base_30.pink },
  },

  git = {
    DiffAdd = { bg = M.base_30.darkgreen },
    DiffAdded = { bg = M.base_30.darkgreen },
    DiffDelete = { bg = M.base_30.brownred },
    DiffRemoved = { bg = M.base_30.brownred },
    DiffChangeDelete = { bg = M.base_30.brownred },
    DiffChange = { bg = M.base_30.darkyellow, fg = M.base_30.yellow },
    DiffChanged = { bg = M.base_30.darkyellow, fg = M.base_30.yellow },
    DiffModified = { bg = M.base_30.darkyellow, fg = M.base_30.yellow },
  },

  syntax = {
    Search = { bg = M.base_30.darkyellow, fg = M.base_30.yellow },
    SearchInc = { bg = M.base_30.darkyellow, fg = M.base_30.yellow },
    IncSearch = { bg = M.base_30.darkyellow, fg = M.base_30.yellow },
    CurSearch = { bg = M.base_30.yellow, fg = M.base_30.black },
    Substitute = { bg = M.base_30.darkyellow, fg = M.base_30.yellow },
  },
}

M.type = "dark"

M = require("base46").override_theme(M, "nightscape")

return M
