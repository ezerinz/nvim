local Plugin = { "nvim-lualine/lualine.nvim" }

Plugin.event = "VeryLazy"

Plugin.dependencies = { "nvim-tree/nvim-web-devicons" }

Plugin.opts = {
	options = {
		theme = "auto",
		disabled_filetypes = {
			statusline = { "alpha", "dashboard", "lazy" },
		},
		section_separators = { left = "", right = "" },
		component_separators = { left = "", right = "" },
		globalstatus = true,
	},
}

return Plugin
