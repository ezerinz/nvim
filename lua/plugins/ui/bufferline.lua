-- bufferline
return {
	"akinsho/bufferline.nvim",
	event = "BufRead",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		local bs = require("util").bufferline_setting()
		local highlights = function()
			local fg = "#ffffff"
			local bg = "#11111b"
			return {
				background = {
					bg = bg,
				},
				buffer_visible = {
					bg = bg,
				},
				close_button = {
					bg = bg,
				},
				duplicate = {
					bg = bg,
				},
				duplicate_selected = {
					bg = bg,
					fg = fg,
					bold = true,
				},
				duplicate_visible = {
					bg = bg,
				},
				fill = {
					bg = bg,
				},
				indicator_visible = {
					bg = bg,
				},
				modified = {
					bg = bg,
				},
				separator = {
					bg = bg,
					fg = bg,
				},
				separator_visible = {
					bg = bg,
					fg = bg,
				},
			}
		end
		require("bufferline").setup({
			options = {
				diagnostics = "nvim_lsp",
				offsets = {
					{
						filetype = "neo-tree",
						text = "File Explorer",
						text_align = "center",
						separator = true,
					},
				},
				show_buffer_close_icons = false,
				show_close_icon = false,
			},
			highlights = highlights,
		})
	end,
}
