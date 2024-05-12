local Plugin = { "akinsho/toggleterm.nvim" }

Plugin.version = "*"

Plugin.cmd = "ToggleTerm"

Plugin.keys = {
	{
		"<leader>tr",
		function()
			require("toggleterm").exec(require("user.terminal").code_runner(vim.bo.filetype))
		end,
	},
	{
		"<leader>th",
		function()
			require("toggleterm").toggle_command("direction=horizontal")
		end,
		mode = { "n", "t" },
	},
	{
		"<leader>tv",
		function()
			require("toggleterm").toggle_command("direction=vertical")
		end,
		mode = { "n", "t" },
	},
	{
		"<leader>tf",
		function()
			require("toggleterm").toggle_command("direction=float")
		end,
		mode = { "n", "t" },
	},
}

Plugin.opts = {
	on_create = function(t)
		t:clear()
	end,
	size = function(term)
		if term.direction == "horizontal" then
			return 12
		elseif term.direction == "vertical" then
			return vim.o.columns * 0.25
		end
	end,
	autochdir = true,
}

return Plugin
