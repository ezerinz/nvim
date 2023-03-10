return {
	"nvim-neo-tree/neo-tree.nvim",
	keys = {
		{ "<leader>nt", "<cmd>Neotree toggle<CR>" },
		{ "<leader>nm", "<cmd>Neotree focus<CR>" },
	},
	cmd = "Neotree toggle",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
		"MunifTanjim/nui.nvim",
	},
	opts = {
		window = {
			position = "left",
			width = 29,
		},
		filesystem = {
			follow_current_file = true,
		},
		buffers = {
			follow_current_file = true,
		},
	},
}
