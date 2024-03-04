return {
	"kosayoda/nvim-lightbulb",
	event = "VeryLazy",
	dependencies = "antoinemadec/FixCursorHold.nvim",
	config = function()
		require("nvim-lightbulb").setup({
			autocmd = {
				enabled = true,
			},
			sign = {
				text = "",
			},
		})
	end,
}
