-- bufferline
return {
	"akinsho/bufferline.nvim",
	event = "BufRead",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		local bs = require("util").bufferline_setting()
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
			highlights = {
				--[[fill = {
          bg = {
            attribute = "bg",
            highlight = "Pmenu"
          }
        },
        background = {
          bg = {
            attribute = "bg",
            highlight = "Pmenu"
          }
        },
       separator = {
          --fg = "#1f2335",
          bg = {
            attribute = "bg",
            highlight = "Pmenu"
          },
        },]]
				offset_separator = {
					bg = "none",
				},
			},
		})
	end,
}
