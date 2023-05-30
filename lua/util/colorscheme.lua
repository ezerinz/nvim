local M = {}
local pickers = require("telescope.pickers")
local finders = require("telescope.finders")
local conf = require("telescope.config").values
local actions = require("telescope.actions")
local action_state = require("telescope.actions.state")

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
current_color = vim.api.nvim_command_output("color")

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
			table.insert(colors, color)
		end
	end
	return colors
end

local colorspicker = function(opts)
	opts = opts or {}
	local before_color = current_color
	local colors = get_colors() or { before_color }

	if not vim.tbl_contains(colors, before_color) then
		table.insert(colors, 1, before_color)
	end

	colors = vim.list_extend(
		{ before_color },
		vim.tbl_filter(function(color)
			return color ~= before_color
		end, colors)
	)

	pickers
		.new(opts, {
			prompt_title = "Choose Colorscheme | Current: " .. before_color,
			finder = finders.new_table({
				results = colors,
			}),
			sorter = conf.generic_sorter(opts),
			attach_mappings = function(prompt_bufnr, map)
				actions.select_default:replace(function()
					actions.close(prompt_bufnr)
					local selection = action_state.get_selected_entry()
					vim.cmd("colorscheme " .. selection[1])
					write = string.format("vim.cmd.colorscheme('%s')", selection[1])
					require("lazy.util").write_file(file_path, write)
				end)
				return true
			end,
		})
		:find()
end

colorspicker(require("telescope.themes").get_dropdown({}))
