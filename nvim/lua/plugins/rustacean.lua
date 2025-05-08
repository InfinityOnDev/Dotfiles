return {
  "mrcjkb/rustaceanvim",
  version = "^6",
  lazy = false,
  config = function()
    local mason_registry = require("mason-registry")
    local codelldb = mason_registry.get_package("codelldb")

    if not codelldb then
      vim.notify("codelldb is not installed. Please install it using :MasonInstall codelldb", vim.log.levels.ERROR)
      return
    end

    -- Paths for codelldb adapter and liblldb
    local extension_path = vim.fn.stdpath("data") .. "/mason/packages/codelldb/extension/"
    local codelldb_path = extension_path .. "adapter/codelldb"
    local liblldb_path = extension_path .. "lldb/lib/liblldb.so"

    local cfg = require("rustaceanvim.config")

    vim.g.rustaceanvim = {
      dap = {
        adapter = cfg.get_codelldb_adapter(codelldb_path, liblldb_path),
      },
      server = {
        on_attach = function(_, bufnr)
          local map = function(mode, lhs, rhs)
            vim.keymap.set(mode, lhs, rhs, { buffer = bufnr })
          end

          map("n", "K", vim.lsp.buf.hover)
          map("n", "gd", vim.lsp.buf.definition)
          map("n", "<leader>ca", vim.lsp.buf.code_action)
        end,
        default_settings = {
          ["rust-analyzer"] = {
            cargo = {
              allFeatures = true,
            },
            check = {
              command = "clippy",
              extraArgs = { "--no-deps" },
            },
            diagnostics = {
              enable = true,
            },
          },
        },
      },
    }
  end,
}

