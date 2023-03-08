local M = {}
local Menu = require("nui.menu")
local event = require("nui.utils.autocmd").event
disable = {
	"darkblue",
	"default",
	"delek",
	"desert",
	"elflord",
	"evening",
	"industry",
	"koehler",
	"morning",
	"murphy",
	"pablo",
	"peachpuff",
	"ron",
	"shine",
	"slate",
	"torte",
	"blue",
	"habamax",
	"lunaperche",
	"quiet",
	"zellner",
}
file_path = os.getenv("HOME") .. "/.config/nvim/lua/util/colorscheme-persist.lua"

local function get_colors()
	local colors = {}
	local all_colors = vim.fn.getcompletion("", "color")
	for _, color in ipairs(all_colors) do
		local ignored = false
		for _, disabled_color in ipairs(disable) do
			if color == disabled_color then
				ignored = true
				break
			end
		end
		if not ignored then
			table.insert(colors, Menu.item(color))
		end
	end
	return colors
end
current_color = vim.api.nvim_command_output("color")
local menu = Menu({
	position = { row = "10%", col = "95%" },
	size = {
		width = 35,
		height = 5,
	},
	border = {
		style = "rounded",
		text = {
			top = " Choose Colorscheme ",
			top_align = "center",
			bottom = " Current: " .. current_color .. " ",
			bottom_align = "center",
		},
	},
	win_options = {
		winhighlight = "Normal:Normal,FloatBorder:Normal",
	},
}, {
	lines = get_colors(),
	max_width = 20,
	keymap = {
		focus_next = { "j", "<Down>", "<Tab>" },
		focus_prev = { "k", "<Up>", "<S-Tab>" },
		close = { "<Esc>", "<C-c>" },
		submit = { "<CR>", "<Space>" },
	},
	on_close = function()
		print("Menu Closed!")
	end,
	on_submit = function(item)
		vim.cmd("colorscheme " .. item.text)
		write = string.format("vim.cmd.colorscheme('%s')", item.text)
		require("lazy.util").write_file(file_path, write)
	end,
})

menu:mount()
