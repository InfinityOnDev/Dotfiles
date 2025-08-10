return {
	"nvimtools/none-ls.nvim",
	dependencies = {
		"nvimtools/none-ls-extras.nvim",
	},

	config = function()
		local null_ls = require("null-ls")
		local capabilities = vim.lsp.protocol.make_client_capabilities()
		capabilities.textDocument.positionEncoding = "utf-16"

		-- Setup null-ls with sources for formatting, diagnostics, etc.
		null_ls.setup({
      capabilities = capabilities,
			sources = {
				-- Formatting sources
				null_ls.builtins.formatting.stylua,
				null_ls.builtins.formatting.black,
				null_ls.builtins.formatting.clang_format,
				-- Diagnostics sources
				null_ls.builtins.diagnostics.mypy,
				-- Other sources
				null_ls.builtins.completion.spell,
			},

			-- Custom function to attach keymaps and additional settings
			on_attach = function(_, bufnr)
				local function map(mode, lhs, rhs)
					vim.keymap.set(mode, lhs, rhs, { buffer = bufnr })
				end

				-- LSP-related keymaps
				map("n", "gd", vim.lsp.buf.definition) -- Go to definition
				map("n", "K", vim.lsp.buf.hover) -- Hover to show documentation
				map("n", "<leader>ca", vim.lsp.buf.code_action) -- Code actions (e.g., quick fixes)
			end,
		})

		-- Set global keymap for formatting
		vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
	end,
}
