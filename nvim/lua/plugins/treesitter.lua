return {

	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",

	config = function()
		local configs = require("nvim-treesitter.configs")
		configs.setup({
			ensure_installed = { "c", "cpp", "vim", "vimdoc", "lua", "python", "latex" },
			sync_install = false,
			auto_install = false,
			highlight = { enable = true },
			indent = { enable = true },
		})
	end,
}
