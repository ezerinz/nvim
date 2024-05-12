local M = {}

local gsub_cmd = function(cmd)
	local absolute_path = vim.fn.expand("%:p")
	local path = vim.fn.fnamemodify(absolute_path, ":h")
	local filename = vim.fn.fnamemodify(absolute_path, ":t")
	local filename_only = vim.fn.fnamemodify(filename, ":r")

	cmd = cmd:gsub("$path", path)
	cmd = cmd:gsub("$fnOnly", filename_only)
	cmd = cmd:gsub("$fn", filename)
	return cmd
end

M.code_runner = function(ft)
	local cmd = require("user.code-runner")[ft]
	cmd = type(cmd) == "function" and cmd() or cmd
	cmd = type(cmd) == "table" and table.concat(cmd, " ") or cmd
	local default = "echo 'filetype not recognized'"
	return cmd and gsub_cmd(cmd) or default
end

M.set_terminal_keymaps = function()
	local opts = { buffer = 0 }
	vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], opts)
	vim.keymap.set("t", "jk", [[<C-\><C-n>]], opts)
	vim.keymap.set("t", "<C-h>", [[<Cmd>wincmd h<CR>]], opts)
	vim.keymap.set("t", "<C-j>", [[<Cmd>wincmd j<CR>]], opts)
	vim.keymap.set("t", "<C-k>", [[<Cmd>wincmd k<CR>]], opts)
	vim.keymap.set("t", "<C-l>", [[<Cmd>wincmd l<CR>]], opts)
	vim.keymap.set("t", "<C-w>", [[<C-\><C-n><C-w>]], opts)
end

return M
