return {
	"kosayoda/nvim-lightbulb",
	event = "VeryLazy",
	dependencies = "antoinemadec/FixCursorHold.nvim",
	config = function()
		require("nvim-lightbulb").setup({
			autocmd = {
				enabled = true,
			},
		})
		vim.fn.sign_define("LightBulbSign", { text = "", texthl = "DiagnosticWarn", numhl = "", linehl = "" })
	end,
}
