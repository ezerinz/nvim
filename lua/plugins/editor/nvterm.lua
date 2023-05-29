local util = require("util")

return {
	"NvChad/nvterm",
	--event = "VeryLazy",
	keys = {
		{
			"<leader>tr",
			function()
				require("nvterm.terminal").send(require("util.code-runner").term_cmds(vim.bo.filetype))
			end,
		},
		{
			"<leader>tb",
			function()
				require("nvterm.terminal").toggle("horizontal")
			end,
			mode = { "n", "t" },
		},
		{
			"<leader>tv",
			function()
				require("nvterm.terminal").toggle("vertical")
			end,
			mode = { "n", "t" },
		},
		{
			"<leader>tf",
			function()
				require("nvterm.terminal").toggle("float")
			end,
			mode = { "n", "t" },
		},
	},
	opts = {
		terminals = {
			type_opts = {
				horizontal = {
					split_ratio = 0.40,
				},
				vertical = {
					split_ratio = 0.3,
				},
			},
		},
	},
}
