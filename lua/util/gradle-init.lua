local Input = require("nui.input")
local event = require("nui.utils.autocmd").event
local Job = require("plenary.job")
local java_project_dir = vim.fn.expand("$HOME/Documents/SemuaJava/")

function delete_dir(dir_name)
	Job:new({
		command = "rm",
		args = { "-r", dir_name },
		cwd = java_project_dir,
	}):sync()
end

function open_term(dir_name)
	cmd_str = "gradle init --package " .. string.lower(dir_name)
	cmd = {}
	for w in cmd_str:gmatch("%S+") do
		table.insert(cmd, w)
	end
	require("util").float_term(cmd, {
		cwd = java_project_dir .. dir_name,
		on_exit = function()
			vim.cmd("cd " .. java_project_dir)
			vim.cmd("Neotree focus")
		end,
	})
	vim.keymap.set("t", "<esc>", function()
		vim.cmd("bd!")
		delete_dir(dir_name)
		vim.cmd("cd " .. java_project_dir)
		print("Gradle init closed")
	end, { buffer = 0 })
end
local M = {}
function M.start()
	local input = Input({
		position = "50%",
		size = {
			width = 20,
		},
		border = {
			style = "single",
			text = {
				top = "[Project Name]",
				top_align = "center",
			},
		},
		win_options = {
			winhighlight = "Normal:Normal,FloatBorder:Normal",
		},
	}, {
		prompt = "> ",
		on_close = function()
			print("Gradle init closed")
		end,
		on_submit = function(value)
			err = false
			dir_name = value

			local job = Job:new({
				command = "mkdir",
				args = { dir_name },
				cwd = java_project_dir,
				on_stderr = function()
					print("Error creating project")
					err = true
				end,
			})
			job:sync()

			if not err then
				open_term(dir_name)
			end
		end,
	})
	input:map("i", "<Esc>", function()
		input:unmount()
		print("Gradle init closed")
	end, { noremap = true })

	-- mount/open the component
	input:mount()

	-- unmount component when cursor leaves buffer
	input:on(event.BufLeave, function()
		input:unmount()
	end)
end

return M
