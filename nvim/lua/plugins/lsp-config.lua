return {

	{
		"williamboman/mason.nvim",
		lazy = true,

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
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = { "lua_ls", "pyright", "clangd" },
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		lazy = true,
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			local lspconfig = require("lspconfig")
			lspconfig.lua_ls.setup({
				capabilities = capabilities,
			})
			lspconfig.pyright.setup({
				capabilities = capabilities,
				on_attach = on_attach,
				filetypes = { "python" },
			})
			lspconfig.clangd.setup({
				capabilities = capabilities,
				on_attach = on_attach,
			})
			lspconfig.ruff.setup({
				capabilities = capabilities,
				on_attach = on_attach,
				filetypes = { "python" },
			})

			vim.keymap.set("n", "L", vim.lsp.buf.hover, {})
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
			vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
		end,
	},
}
