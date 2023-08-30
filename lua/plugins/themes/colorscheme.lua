return {
	{
		"folke/tokyonight.nvim",
		event = "VeryLazy",
		opts = {
			-- transparent = true,
		},
	},

	--[[	{
		"ellisonleao/gruvbox.nvim",
		event = "VeryLazy",
		opts = {
			overrides = {
				IlluminatedWordText = { bg = "#504945" },
			},
		},
	},]]

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
			transparent_background = true,
			integrations = {
				illuminate = true,
				indent_blankline = {
					enabled = true,
					colored_indent_levels = true,
				},
			},
		},
	},

	{
		"rebelot/kanagawa.nvim",
		event = "VeryLazy",
	},
}
