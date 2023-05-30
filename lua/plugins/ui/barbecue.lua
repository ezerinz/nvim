return {
	"utilyre/barbecue.nvim",
	event = { "BufReadPost", "BufNewFile" },
	name = "barbecue",
	version = "*",
	dependencies = {
		"SmiteshP/nvim-navic",
		"nvim-tree/nvim-web-devicons", -- optional dependency
	},
	opts = {},
}
