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

M.set_rename_keymap = function(client)
	vim.keymap.set("n", "<leader>rn", function()
		if client and client.supports_method("textDocument/rename") then
			return ":IncRename " --.. vim.fn.expand("<cword>")
		end

		vim.notify("[inc-rename] No active language server with rename capability", vim.lsp.log_levels.WARN)
	end, { expr = true })
end

M.on_lsp_attach = function(args)
	local bufnr = args.buf
	local client = vim.lsp.get_client_by_id(args.data.client_id)

	M.format_on_save(client, bufnr)

	local bufmap = function(mode, lhs, rhs)
		local opts = { buffer = bufnr }
		vim.keymap.set(mode, lhs, rhs, opts)
	end

	M.set_rename_keymap(client)

	-- Displays hover information about the symbol under the cursor
	bufmap("n", "K", "<cmd>lua vim.lsp.buf.hover()<cr>")

	-- Jump to the definition
	bufmap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>")

	-- Jump to declaration
	bufmap("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>")

	-- Lists all the implementations for the symbol under the cursor
	bufmap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<cr>")

	-- Jumps to the definition of the type symbol
	bufmap("n", "go", "<cmd>lua vim.lsp.buf.type_definition()<cr>")

	-- Lists all the references
	bufmap("n", "gr", "<cmd>lua vim.lsp.buf.references()<cr>")

	-- Displays a function's signature information
	bufmap("n", "gs", "<cmd>lua vim.lsp.buf.signature_help()<cr>")

	-- Renames all references to the symbol under the cursor
	bufmap("n", "<F2>", "<cmd>lua vim.lsp.buf.rename()<cr>")

	-- Selects a code action available at the current cursor position
	bufmap("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<cr>")

	-- Show diagnostics in a floating window
	bufmap("n", "gl", "<cmd>lua vim.diagnostic.open_float()<cr>")

	-- Move to the previous diagnostic
	bufmap("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<cr>")

	-- Move to the next diagnostic
	bufmap("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<cr>")
end

return M
