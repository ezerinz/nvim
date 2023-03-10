return {
	-- set and persist colorscheme
	{
		"ezerinz/colorscheme-persist.nvim",
		cmd = "ColorschemePersist",
		dependencies = {
			"nvim-telescope/telescope-dap.nvim",
		},
		config = function()
			require("colorscheme-persist").setup()
		end,
	},

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
			underline = false,
			undercurl = false,
		},
	},
	--[[  {
    "catppuccin/nvim",
    event = "VeryLazy",
  },
]]
}
