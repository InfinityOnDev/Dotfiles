return {
	"nvim-lualine/lualine.nvim",
	priority = 100,
	config = function()
		require("lualine").setup({
      options = {
				theme = "solarized_dark",
			},
		})
	end,
}
