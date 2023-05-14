return {
	{
		"folke/tokyonight.nvim",
		event = "VeryLazy",
		opts = {
			transparent = false,
		},
	},

	{
		"ellisonleao/gruvbox.nvim",
		event = "VeryLazy",
		opts = {
			overrides = {
				IlluminatedWordText = { bg = "#504945" },
			},
		},
	},

	{
		"catppuccin/nvim",
		name = "catppuccin",
		event = "VeryLazy",
		opts = {
			custom_highlights = function(C)
				return {
					NeoTreeNormalNc = { fg = C.text, bg = C.crust },
					NeoTreeNormal = { fg = C.text, bg = C.crust },
				}
			end,
		},
	},

	{
		"rebelot/kanagawa.nvim",
		event = "VeryLazy",
	},
}
