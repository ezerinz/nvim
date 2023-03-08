-- better vim.ui
return {
	"stevearc/dressing.nvim",
	event = "VeryLazy",
	dependencies = {
		"MunifTanjim/nui.nvim",
	},
	opts = {
		select = {
			get_config = function(opts)
				if opts.kind == "codeaction" then
					return {
						telescope = require("telescope.themes").get_cursor(),
					}
				end
			end,
		},
	},
}
