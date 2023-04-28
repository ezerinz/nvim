return {
	"jose-elias-alvarez/null-ls.nvim",
	event = "BufReadPre",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"jay-babu/mason-null-ls.nvim",
	},

	config = function()
		require("mason-null-ls").setup({
			ensure_installed = {
				-- Opt to list sources here, when available in mason.
			},
			automatic_installation = true,
			handlers = {},
		})
		require("null-ls").setup({
			on_attach = require("util").format_on_save,
			sources = {},
		})
		-- require 'mason-null-ls'.setup_handlers()
	end,
}
