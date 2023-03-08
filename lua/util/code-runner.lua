local M = {}
ft_cmds = {
	python = "cd $path && python3 $fn",
	javascript = "cd $path && node $fn",
	html = "cd $path && firefox $fn",
	lua = "cd $path && lua $fn",
	java = function()
		java_root = require("jdtls.setup").find_root({ "gradlew" })

		return java_root and "cd " .. java_root .. " && gradle --console plain run"
			or "cd $path && javac $fn && java $fnOnly"
	end,
	php = "cd $path && php $fn",
}

function gsub_cmd(cmd)
	absolute_path = vim.fn.expand("%:p")
	path = vim.fn.fnamemodify(absolute_path, ":h")
	filename = vim.fn.fnamemodify(absolute_path, ":t")
	filename_only = vim.fn.fnamemodify(filename, ":r")

	cmd = cmd:gsub("$path", path)
	cmd = cmd:gsub("$fnOnly", filename_only)
	cmd = cmd:gsub("$fn", filename)
	return cmd
end

function M.term_cmds(ft)
	cmd = ft_cmds[ft]
	cmd = type(cmd) == "function" and cmd() or cmd
	default = "echo '\\nfiletype not recognized\\nMaybe set command for this filetype?'"
	return cmd and gsub_cmd(cmd) or default
end

return M
