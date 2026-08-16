-- Credits to original theme https://github.com/evondev/evondev-dracula
-- Nightscape variant: the same blue-leaning palette, desaturated and softened.

local M = {}

M.base_30 = {
  -- Core gradient for UI foregrounds and backgrounds
  white         = "#9fd0e9", -- main foreground (near-white) full saturation: #f5fcff
  darker_black  = "#052330", -- deepest accents / gutters / alt bg
  black         = "#061319", -- main background sibling
  black2        = "#052330", -- cursorline / selection bg (wet asphalt under light)

  one_bg        = "#053247", -- 1 step lighter than black2
  one_bg2       = "#04425E", -- 2 steps lighter
  one_bg3       = "#045175", -- 3 steps lighter

  grey          = "#2e6589", -- desaturated UI grey, ~40% lighter than black
  grey_fg       = "#376e93", -- 1 step lighter than grey (comments)
  grey_fg2      = "#40779c", -- 2 steps lighter
  light_grey    = "#4980a5", -- soft, readable UI text / subtle borders

  line          = "#045175", -- split / border line, just above black2

  -- UI backgrounds
  statusline_bg = "#052330",
  lightbg       = "#045175",

  -- UI accent colors
  pmenu_bg      = "#29adce",
  folder_bg     = "#29adce",

  -- Semantic/Utility colors
  red           = "#b76a83",
  yellow        = "#a58936",
  green         = "#65995a",

  -- Dark utility colors
  brownred      = "#29242E",
  darkyellow    = "#262B1F",
  darkgreen     = "#192E26",

  -- Nightscape spectrum

  orange        = "#b5714a",
  teal          = "#03bcb5",
  vibrant_green = "#03bcb5",
  cyan          = "#29adce",
  blue          = "#29adce",
  nord_blue     = "#5690c9",
  violet        = "#5690c9",
  dark_purple   = "#787cbf",
  purple        = "#9873b3",
  pink          = "#ae6d99",

  -- Soft colors
  sun           = "#b7813e",
  baby_pink     = "#ae6d99",
}

M.base_16 = {
  -- Background / foreground colors
  base00 = M.base_30.black,        -- Default Background
  base01 = M.base_30.one_bg,       -- Lighter Background (Used for status bars, line number and folding marks)
  base02 = M.base_30.black2,       -- Selection Background
  base03 = M.base_30.grey,         -- Comments, Invisibles, Line Highlighting
  base04 = M.base_30.grey_fg,      -- Dark Foreground (Used for status bars)
  base05 = M.base_30.white,        -- Default Foreground, Caret, Delimiters, Operators
  base06 = M.base_30.grey,         -- Light Foreground (Not often used)
  base07 = M.base_30.one_bg3,      -- Light Background (Not often used)

  -- Syntax highlights
  base08 = M.base_30.blue,         -- Variables, XML Tags, Markup Link Text, Markup Lists, Diff Deleted
  base09 = M.base_30.orange,       -- Integers, Boolean, Constants, XML Attributes, Markup Link Url
  base0A = M.base_30.teal,         -- Classes, Markup Bold, Search Text Background
  base0B = M.base_30.sun,          -- Strings, Inherited Class, Markup Code, Diff Inserted
  base0C = M.base_30.purple,       -- Support, Regular Expressions, Escape Characters, Markup Quotes
  base0D = M.base_30.violet,       -- Functions, Methods, Attribute IDs, Headings
  base0E = M.base_30.pink,         -- Keywords, Storage, Selector, Markup Italic, Diff Changed
  base0F = M.base_30.grey,         -- Deprecated, Opening/Closing Embedded Language Tags, e.g. <?php ?>
}

M.polish_hl = {
  telescope = {
    TelescopeMatching = { bg = M.base_30.darkyellow, fg = M.base_30.yellow },
    TelescopeSelection = { fg = "none" },
  },

  treesitter = {
    ["@keyword.repeat"] = { fg = M.base_30.pink },
    ["@string.documentation"] = { fg = M.base_30.one_bg3 },
    ["@comment"] = { fg = M.base_30.one_bg3 },
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

M = require("base46").override_theme(M, "nightscape_fog")

return M
