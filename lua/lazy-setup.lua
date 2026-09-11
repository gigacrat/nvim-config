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
  -- Plugins I author resolve to a local checkout under `path`, so edits are
  -- live without a reinstall. `fallback` fetches from git instead on machines
  -- where that checkout isn't present.
  dev = {
    path = "~/Projects/nvim",
    patterns = { "gigacrat" },
    fallback = true,
  },
  spec = {
    -- Import plugins from lua/plugins/
    { import = "plugins" },
  },
  checker = { enabled = true }, -- automatically check for plugin updates
  ui = {
    border = "rounded"
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
