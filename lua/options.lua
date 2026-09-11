-- Vim options

-- Leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- Word Wrap
vim.opt.wrap = false

-- Indentation
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2

-- Search
vim.opt.ignorecase = true -- Case-insensitive search...
vim.opt.smartcase = true -- ...unless the pattern contains a capital letter

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
vim.opt.winborder = "rounded"

-- 'winborder' applies to any float opened without an explicit border, which
-- catches lazy.nvim's full-screen backdrop and draws a rounded box around the
-- whole editor. Strip it back off; a backdrop is meant to be invisible.
-- Matched by filetype convention (`lazy_backdrop`, `mason_backdrop`, ...)
-- rather than by guessing from window geometry.
vim.api.nvim_create_autocmd("FileType", {
  pattern = "*_backdrop",
  callback = function(ev)
    for _, win in ipairs(vim.fn.win_findbuf(ev.buf)) do
      vim.api.nvim_win_set_config(win, { border = "none" })
    end
  end,
})

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

