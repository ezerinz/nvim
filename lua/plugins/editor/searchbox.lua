return {
	"VonHeikemen/searchbox.nvim",
	dependencies = {
		"MunifTanjim/nui.nvim",
	},
	keys = {
		{ "<leader>zz", ":SearchBoxIncSearch<CR>" },
		{ "<leader>zr", ":SearchBoxReplace<CR>" },
	},
	opts = {
		popup = {
			win_options = {
				winhighlight = "Normal:Normal,FloatBorder:Normal",
			},
		},
	},
}
