return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    "nvim-telescope/telescope.nvim",
  },
  config = function()
    -- Keybindings when LSP attaches to buffer
    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("UserLspConfig", {}),
      callback = function(ev)
        local opts = { buffer = ev.buf, noremap = true, silent = true }
        local builtin = require("telescope.builtin")

        -- Which key an LSP action gets follows one rule:
        --
        --   Override a vanilla key in place only when the LSP feature is a
        --   strict upgrade of what that key already meant. Everything else
        --   lives in Neovim's gr* namespace (:help lsp-defaults).
        --
        -- gd/gD qualify: vanilla they are "Goto local/global Declaration"
        -- (:help gd), a text-search approximation of the same idea, and the
        -- docs concede it "may not work well" outside C. K qualifies too --
        -- vanilla it consults 'keywordprg'. Neovim agrees: it maps K to hover
        -- automatically but deliberately leaves gd alone, routing definition
        -- through 'tagfunc' (<C-]>) instead, which is why gr* has no "grd".
        --
        -- gi did NOT qualify and was removed: vanilla it resumes insert at the
        -- last edit position, unrelated to LSP implementation, which already
        -- has gri. Mapping bare gr/gi also shadowed the whole gr* namespace and
        -- made every press wait out 'timeoutlen'.
        vim.keymap.set("n", "gD", vim.lsp.buf.declaration, vim.tbl_extend("force", opts, { desc = "Go to declaration" }))
        vim.keymap.set("n", "gd", builtin.lsp_definitions, vim.tbl_extend("force", opts, { desc = "Go to definition" }))
        vim.keymap.set("n", "K", vim.lsp.buf.hover, vim.tbl_extend("force", opts, { desc = "Hover documentation" }))

        -- Built-in gr* keys re-pointed at Telescope pickers, so multi-result
        -- queries give a filterable list instead of the quickfix. gra/grn/grx
        -- stay native: they route through vim.ui.select/input, which
        -- telescope-ui-select already renders as a picker.
        vim.keymap.set("n", "grr", builtin.lsp_references, vim.tbl_extend("force", opts, { desc = "References" }))
        vim.keymap.set("n", "gri", builtin.lsp_implementations, vim.tbl_extend("force", opts, { desc = "Go to implementation" }))
        vim.keymap.set("n", "grt", builtin.lsp_type_definitions, vim.tbl_extend("force", opts, { desc = "Type definition" }))

        -- LSP actions under <leader>l
        vim.keymap.set("n", "<leader>lr", vim.lsp.buf.rename, vim.tbl_extend("force", opts, { desc = "Rename symbol" }))
        vim.keymap.set({ "n", "v" }, "<leader>la", vim.lsp.buf.code_action, vim.tbl_extend("force", opts, { desc = "Code action" }))
        vim.keymap.set("n", "<leader>lf", function()
          vim.lsp.buf.format({ async = true })
        end, vim.tbl_extend("force", opts, { desc = "Format buffer" }))
        vim.keymap.set("n", "<leader>ld", vim.diagnostic.open_float, vim.tbl_extend("force", opts, { desc = "Line diagnostics" }))
        vim.keymap.set("n", "<leader>ls", builtin.lsp_document_symbols, vim.tbl_extend("force", opts, { desc = "Document symbols" }))
        vim.keymap.set("n", "<leader>lS", builtin.lsp_workspace_symbols, vim.tbl_extend("force", opts, { desc = "Workspace symbols" }))
        vim.keymap.set("n", "<leader>li", "<cmd>LspInfo<cr>", vim.tbl_extend("force", opts, { desc = "LSP info" }))
        vim.keymap.set("n", "<leader>lR", "<cmd>LspRestart<cr>", vim.tbl_extend("force", opts, { desc = "Restart LSP" }))
      end,
    })

    -- Capabilities (will be enhanced by nvim-cmp if installed)
    local capabilities = vim.lsp.protocol.make_client_capabilities()

    -- Server configurations using new vim.lsp.config API
    local servers = {
      lua_ls = {
        settings = {
          Lua = {
            diagnostics = { globals = { "vim" } },
            workspace = {
              library = vim.api.nvim_get_runtime_file("", true),
              checkThirdParty = false,
            },
            telemetry = { enable = false },
          },
        },
      },
      pyright = {},
      ts_ls = {},
      bashls = {},
      jsonls = {},
      yamlls = {},
    }

    -- Setup each server using vim.lsp.config
    for server, config in pairs(servers) do
      config.capabilities = capabilities
      vim.lsp.config[server] = config
      vim.lsp.enable(server)
    end

    -- Diagnostic configuration
    vim.diagnostic.config({
      virtual_text = true,
      signs = {
        text = {
          [vim.diagnostic.severity.ERROR] = "✘",
          [vim.diagnostic.severity.WARN] = "",
          [vim.diagnostic.severity.HINT] = "",
          [vim.diagnostic.severity.INFO] = "",
        },
      },
      underline = true,
      update_in_insert = false,
      severity_sort = true,
    })
  end,
}
