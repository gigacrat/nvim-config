-- nvim-treesitter on the `main` branch.
--
-- The `master` branch is EOL and predates a breaking change to the Neovim
-- query API: directives now receive a *list* of nodes per capture, but
-- master's query_predicates.lua still treats match[id] as a single TSNode.
-- Its queries shadow Neovim's (plugin rtp precedes $VIMRUNTIME), so opening
-- markdown, bash, ruby, hcl, php or hurl blew up in the highlighter with
-- "attempt to call method 'range' (a nil value)".
--
-- `main` drops query_predicates.lua entirely and ships queries that use
-- @injection.language directly, so that whole class of failure is gone.
return {
  "nvim-treesitter/nvim-treesitter",
  branch = "main",
  -- main does not support lazy-loading; see its README.
  lazy = false,
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter").install({
      "lua",
      "vim",
      "vimdoc",
      "bash",
      "python",
      "javascript",
      "typescript",
      "json",
      "yaml",
      "markdown",
      "markdown_inline",
    })

    -- On main there are no highlight/indent module tables; both are opt-in
    -- per buffer. Driven off pattern "*" rather than a filetype list because
    -- parser names and filetypes do not line up -- the bash parser serves
    -- filetype "sh", vimdoc serves "help", and markdown_inline is injection
    -- only. vim.treesitter.start() resolves the language itself and throws
    -- when no parser is installed, so pcall doubles as the availability check.
    vim.api.nvim_create_autocmd("FileType", {
      group = vim.api.nvim_create_augroup("UserTreesitter", { clear = true }),
      callback = function(ev)
        -- Skip very large files; the parse cost is not worth it.
        local max_filesize = 100 * 1024 -- 100 KB
        local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(ev.buf))
        if ok and stats and stats.size > max_filesize then
          return
        end

        if not pcall(vim.treesitter.start, ev.buf) then
          return
        end

        -- Treesitter indent is flagged experimental upstream.
        vim.bo[ev.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
      end,
    })
  end,
}
