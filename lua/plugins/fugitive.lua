return {
  "tpope/vim-fugitive",
  cmd = { "Git", "G" },
  keys = {
    { "<leader>gg", "<cmd>vert Git commit | startinsert<cr>", desc = "Git Commit" },
    { "<leader>gG", "<cmd>vert Git commit --amend | startinsert<cr>", desc = "Git Amend" }
  }
}
