return {
	"nvim-lualine/lualine.nvim",
	event = "VeryLazy",
	opts = function()
		return {
			options = {
				globalstatus = true,
				disabled_filetypes = {
					statusline = { "alpha", "dashboard", "lazy" },
				},
				section_separators = { left = "", right = "" },
			},
			sections = {
				lualine_x = {
					{
						require("noice").api.statusline.mode.get,
						cond = require("noice").api.statusline.mode.has,
						color = { fg = "#ff9e64" },
					},
					"encoding",
					"fileformat",
					"filetype",
				},
			},
		}
	end,
}
