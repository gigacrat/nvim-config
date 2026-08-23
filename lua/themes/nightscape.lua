local M = {}

M.base_30 = {
  -- Core gradient for UI foregrounds and backgrounds
  darker_black  = "#071a22", -- deepest accents / gutters / alt bg
  black         = "#061319", -- wet asphalt. core theme color
  black2        = "#052330", -- cursorline / selection bg (wet asphalt under light)
  one_bg        = "#053247", -- 1 step lighter than black2
  one_bg2       = "#04425E", -- 2 steps lighter
  one_bg3       = "#045175", -- 3 steps lighter
  lightbg       = "#045175",
  grey          = "#3b7297", -- desaturated UI grey, ~40% lighter than black
  grey_fg       = "#457ca2", -- 1 step lighter than grey (comments)
  grey_fg2      = "#5087ac", -- 2 steps lighter
  light_grey    = "#5a91b7", -- soft, readable UI text / subtle borders
  white         = "#99dfff", -- blue at 85% luminance via HSL

  -- UI backgrounds
  statusline_bg = "#052330",
  line          = "#154257", -- split / border line, just above black2
  pmenu_bg      = "#47C5FF", -- blue at 64% luminance via HSL
  folder_bg     = "#47C5FF",

  -- Semantic fg colors
  red      = "#FF485B", -- error (triad from violet, shifted to 20 hue via OKLCH))
  yellow   = "#FFBD39", -- warning (violet's complement, shifted to 80 hue via OKLCH, then decreased lightness until within sRGB gamut)
  green    = "#74FF49", -- success (triad from violet)

  -- Semantic bg colors (fg colors blended with 000000 at 80% opacity)
  brownred      = "#330E12", -- error / deleted bg
  darkyellow    = "#33260B", -- warning / changed bg
  darkgreen     = "#17330F", -- success / added bg

  -- Monochromatic shifts from nord_blue and purple
  dark_purple   = "#9557F8",
  violet        = "#4974FF",

  -- Neon channel (OKLCH hue shifts from 00AEFF)
  pink          = "#E576C3",
  purple        = "#B488FA",
  nord_blue     = "#7C9BFF",
  blue          = "#00AEFF",
  cyan          = "#00BAD5",
  teal          = "#00C27D",
  vibrant_green = "#6CBB4E",

  -- Halo channel
  orange        = "#F89557", -- triad from dark_purple
  sun           = "#e5c389", -- triad from nord_blue, shifted to 80 hue via OKLCH, then 64% sat
  baby_pink     = "#F5A3DC", -- pink at 80% sat + 80% luminance via HSL
}

M.base_16 = {
  -- Background / foreground colors
  base00 = M.base_30.black,         -- main background (asphalt night)
  base01 = M.base_30.one_bg,        -- slightly lighter bg
  base02 = M.base_30.one_bg2,       -- secondary bg
  base03 = M.base_30.one_bg3,       -- tertiary bg / subtle panels
  base04 = M.base_30.grey,          -- @definition underline only; comments are light_grey/grey_fg
  base05 = M.base_30.white,         -- main foreground (halogen glow)
  base06 = "#a8e4ff",               -- lighter fg
  base07 = "#b3e7ff",               -- lightest fg

  -- Syntax highlights
  base08 = M.base_30.blue,          -- variables / primary color
  base09 = M.base_30.orange,        -- literals
  base0A = M.base_30.teal,          -- types / structs / classes / modules
  base0B = M.base_30.sun,           -- strings
  base0C = M.base_30.purple,        -- Special: regex, string escapes, constructors
  base0D = M.base_30.violet,        -- functions / methods / headings
  base0E = M.base_30.pink,          -- keywords
  base0F = M.base_30.grey_fg2,      -- brackets / delimiters / fold column
}

M.polish_hl = {
  telescope = {
    TelescopeMatching = { bg = M.base_30.darkyellow, fg = M.base_30.yellow },
    TelescopeSelection = { fg = "none" },
  },

  treesitter = {
    -- base46 routes these three to base0A (types). Keep every keyword on one color.
    ["@keyword.repeat"] = { fg = M.base_30.pink },
    ["@keyword.storage"] = { fg = M.base_30.pink },
    ["@keyword.directive"] = { fg = M.base_30.pink },
  },

  git = {
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
    Search = { bg = M.base_30.darkyellow, fg = M.base_30.yellow },
    IncSearch = { bg = M.base_30.darkyellow, fg = M.base_30.yellow },
    CurSearch = { bg = M.base_30.yellow, fg = M.base_30.black },
    Substitute = { bg = M.base_30.darkyellow, fg = M.base_30.yellow },
  },
}

M.type = "dark"

M = require("base46").override_theme(M, "nightscape")

return M
