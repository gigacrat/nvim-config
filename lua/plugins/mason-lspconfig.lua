return {
  "williamboman/mason-lspconfig.nvim",
  dependencies = {
    "williamboman/mason.nvim",
  },
  config = function()
    require("mason-lspconfig").setup({
      -- LSP servers to install automatically
      ensure_installed = {
        "lua_ls",      -- Lua
        "pyright",     -- Python
        "ts_ls",       -- TypeScript/JavaScript
        "bashls",      -- Bash
        "jsonls",      -- JSON
        "yamlls",      -- YAML
      },
      automatic_installation = true,
    })
  end,
}
