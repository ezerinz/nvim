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
	config = function()
		require("nvterm").setup({
			terminals = {
				shell = vim.o.shell,
				list = {},
				type_opts = {
					float = {
						relative = "editor",
						row = 0.3,
						col = 0.2,
						width = 0.6,
						height = 0.4,
						border = "single",
					},
					horizontal = {
						location = "rightbelow",
						split_ratio = 0.40,
					},
					vertical = {
						location = "rightbelow",
						split_ratio = 0.3,
					},
				},
			},
			behavior = {
				autoclose_on_quit = {
					enabled = false,
					confirm = true,
				},
				close_on_exit = true,
				auto_insert = true,
			},
		})
	end,
}
