return {

  -- Mason for managing LSP servers and tools
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup({
        ui = {
          border = "rounded",
          icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗",
          },
        },
      })
    end,
  },

  -- Mason-LSPConfig to bridge Mason with lspconfig
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = { "lua_ls", "pyright", "clangd", "ruff", },
      })
    end,
  },

  -- LSP Configuration using Neovim 0.11+ API (not lazy-loaded)
  {
    "neovim/nvim-lspconfig",
    config = function()
      -- Enable virtual text and other diagnostics visuals
      vim.diagnostic.config({
        virtual_text = true, -- show inline errors
        virtual_lines = false,
        signs = true,    -- show signs in the gutter.nvim
        underline = true, -- underline errors in text
        update_in_insert = false,
        severity_sort = false,
      })

      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      local on_attach = function(_, _)
        -- Optional: Define keymaps or extra behavior on attach
      end

      -- Configure each server
      vim.lsp.config("lua_ls", {
        capabilities = capabilities,
      })

      vim.lsp.config("pyright", {
        capabilities = capabilities,
        on_attach = on_attach,
        filetypes = { "python" },
      })

      vim.lsp.config("clangd", {
        capabilities = capabilities,
        on_attach = on_attach,
      })

      vim.lsp.config("ruff", {
        capabilities = capabilities,
        on_attach = on_attach,
      })

      vim.lsp.config("bashls", {
        capabilities = capabilities,
        on_attach = on_attach,
      })

      -- Enable all LSP servers
      vim.lsp.enable("lua_ls")
      vim.lsp.enable("pyright")
      vim.lsp.enable("clangd")
      vim.lsp.enable("ruff")
      vim.lsp.enable("bashls")
    end,
  },
}
