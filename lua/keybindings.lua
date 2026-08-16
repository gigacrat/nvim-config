-- Basic keybindings

local map = vim.keymap.set

-- Buffer navigation
map("n", "<leader>bn", ":bn<CR>", { desc = "Next buffer", silent = true })
map("n", "<leader>bp", ":bp<CR>", { desc = "Previous buffer", silent = true })
map("n", "<leader>bd", ":bd<CR>", { desc = "Delete buffer", silent = true })
map("n", "<leader>bD", ":bd!<CR>", { desc = "Force delete buffer", silent = true })

-- Keep some Ctrl shortcuts for convenience
map("n", "<C-n>", ":bn<CR>", { desc = "Next buffer", silent = true })
map("n", "<C-p>", ":bp<CR>", { desc = "Previous buffer", silent = true })

-- Window navigation (Ctrl shortcuts)
map("n", "<C-h>", "<C-w>h", { desc = "Move to left window" })
map("n", "<C-j>", "<C-w>j", { desc = "Move to window below" })
map("n", "<C-k>", "<C-w>k", { desc = "Move to window above" })
map("n", "<C-l>", "<C-w>l", { desc = "Move to right window" })

-- Window management
map("n", "<leader>ww", "<C-w>w", { desc = "Other window" })
map("n", "<leader>wd", "<C-w>c", { desc = "Delete window" })
map("n", "<leader>ws", "<C-w>s", { desc = "Split horizontal" })
map("n", "<leader>wv", "<C-w>v", { desc = "Split vertical" })
map("n", "<leader>w=", "<C-w>=", { desc = "Balance windows" })
map("n", "<leader>wh", "<C-w>h", { desc = "Go to left window" })
map("n", "<leader>wj", "<C-w>j", { desc = "Go to window below" })
map("n", "<leader>wk", "<C-w>k", { desc = "Go to window above" })
map("n", "<leader>wl", "<C-w>l", { desc = "Go to right window" })

-- Visual mode refinements. These override keys whose vanilla behaviour they
-- extend rather than replace: < and > still indent, p still pastes.
map("x", "<", "<gv", { desc = "Indent left, keep selection" })
map("x", ">", ">gv", { desc = "Indent right, keep selection" })
map("x", "p", '"_dP', { desc = "Paste over selection, keep register" })

-- Move lines. On Alt rather than visual J/K, which vanilla uses for join
-- and 'keywordprg' -- line moving is not an upgrade of either.
map("n", "<A-j>", "<cmd>m .+1<CR>==", { desc = "Move line down" })
map("n", "<A-k>", "<cmd>m .-2<CR>==", { desc = "Move line up" })
map("x", "<A-j>", ":m '>+1<CR>gv=gv", { desc = "Move selection down", silent = true })
map("x", "<A-k>", ":m '<-2<CR>gv=gv", { desc = "Move selection up", silent = true })

-- Clear search highlights with Escape in normal mode
vim.keymap.set("n", "<esc>", "<cmd>noh<cr>", { desc = "Clear highlights" })

-- Oil file explorer
map("n", "<leader>e", function()
  require("oil").open_float()
end, { desc = "Toggle file explorer (float)" })

map("n", "<leader>E", "<CMD>Oil<CR>", { desc = "Open file explorer at root" })

-- Toggle/Terminal commands
map("n", "<leader>tn", function()
  vim.opt.number = not vim.opt.number:get()
end, { desc = "Toggle line numbers" })

map("n", "<leader>tr", function()
  vim.opt.relativenumber = not vim.opt.relativenumber:get()
end, { desc = "Toggle relative numbers" })

map("n", "<leader>tw", function()
  vim.opt.wrap = not vim.opt.wrap:get()
end, { desc = "Toggle word wrap" })

map("n", "<leader>ts", function()
  vim.opt.spell = not vim.opt.spell:get()
end, { desc = "Toggle spell check" })

map("n", "<leader>tH", function()
  require("base46").load_all_highlights()
  vim.notify("Base46 highlights reloaded", vim.log.levels.INFO)
end, { desc = "Reload highlights" })

-- Search/Replace commands
map("n", "<leader>ss", ":%s/\\v//g<left><left><left>", { desc = "Search and replace in buffer" })
map("n", "<leader>sw", ":%s/\\v<C-r><C-w>//g<left><left>", { desc = "Search and replace word under cursor" })
map("n", "<leader>sr", function()
  require("telescope.builtin").resume()
end, { desc = "Resume last search" })

-- Terminal mode mappings
map("t", "<Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })
map("t", "<C-h>", "<C-\\><C-n><C-w>h", { desc = "Move to left window" })
map("t", "<C-j>", "<C-\\><C-n><C-w>j", { desc = "Move to window below" })
map("t", "<C-k>", "<C-\\><C-n><C-w>k", { desc = "Move to window above" })
map("t", "<C-l>", "<C-\\><C-n><C-w>l", { desc = "Move to right window" })

