local M = {}

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
M.format_on_save = function(client, bufnr)
	if client.supports_method("textDocument/formatting") then
		vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
		vim.api.nvim_create_autocmd("BufWritePre", {
			group = augroup,
			buffer = bufnr,
			callback = function()
				vim.lsp.buf.format({ bufnr = bufnr })
			end,
		})
	end
end

function M.float_term(cmd, opts)
	opts = vim.tbl_deep_extend("force", {
		size = { width = 0.6, height = 0.5 },
	}, opts or {})
	require("lazy.util").float_term(cmd, opts)
end

M.lsp_attach = function(client, bufnr)
	M.format_on_save(client, bufnr)
	vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
	local bufopts = { noremap = true, silent = true, buffer = bufnr }
	vim.keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts)
	vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
	vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
	vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts)
	--vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
	--vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
	--vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
	--[[vim.keymap.set('n', '<space>wl', function()
  print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, bufopts)]]
	vim.keymap.set("n", "<leader>D", vim.lsp.buf.type_definition, bufopts)
	vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, bufopts)
	vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, bufopts)
	vim.keymap.set("n", "gr", vim.lsp.buf.references, bufopts)
	vim.keymap.set("n", "<leader>cf", function()
		vim.lsp.buf.format({ async = true })
	end, bufopts)
end

function is_value_in_list(value, list)
	for i, v in ipairs(list) do
		if v == value then
			return true
		end
	end
end

function M.tbl_merge(first, second)
	for i, value in ipairs(second) do
		if not is_value_in_list(value, first) then
			table.insert(first, value)
		end
	end
end

-- bufferline offset setting based on colorscheme,
-- cause idk why my bufferline offset with neotree didnt aligned
function M.bufferline_setting()
	local colorscheme = vim.api.nvim_command_output("colo")
	local pad = 0
	local bg = "#282828"
	local sep = true

	if string.find(colorscheme, "tokyonight", 1, true) then
		pad = 1
		sep = true
	elseif colorscheme == "gruvbox" then
		sep = false
	end

	local opt = {
		padding = pad,
		background = bg,
		separator = sep,
	}
	return opt
end

return M
