-- Bootstrap lazy.nvim package manager
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Setup lazy.nvim
require("lazy").setup({
  -- Local checkouts of plugins under development; fall back to fetching from
  -- git on machines where the path doesn't exist.
  dev = { path = "~/Projects/nvim", fallback = true },
  spec = {
    -- Import plugins from lua/plugins/
    { import = "plugins" },
  },
  checker = { enabled = true }, -- automatically check for plugin updates
  ui = {
    border = 'rounded'
  },
  performance = {
    rtp = {
      -- disable some rtp plugins
      disabled_plugins = {
        "gzip",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },
})
