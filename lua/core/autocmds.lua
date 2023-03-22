local function augroup(name)
	return vim.api.nvim_create_augroup(name, { clear = true })
end
