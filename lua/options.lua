-- Vim options

-- Leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- Indentation
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2

-- Scroll settings
vim.o.scrolloff = 999
vim.o.scrolljump = -50

-- Split behavior
vim.opt.splitright = true -- Open vertical splits on the right
vim.opt.splitbelow = true -- Open horizontal splits below

-- Clipobard
vim.opt.clipboard = "unnamedplus"

-- UI
vim.opt.fillchars = { eob = " " } -- Hide ~ on non-existent lines
vim.opt.cursorline = true

-- Winbar for non-floating windows only
vim.api.nvim_create_autocmd({"BufWinEnter", "WinEnter", "TermOpen"}, {
  callback = function()
    if vim.api.nvim_win_get_config(0).relative == "" then
      if vim.bo.buftype == "terminal" then
        vim.wo.winbar = "[TERM]"
      else
        vim.wo.winbar = "%<%f %m"
      end
    end
  end
})

