return {
	{
		"neovim/nvim-lspconfig",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"mason.nvim",
			"williamboman/mason-lspconfig.nvim",
		},
		config = function()
			local util = require("util")
			local opts = { noremap = true, silent = true }
			vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, opts)
			vim.keymap.set("n", "<leader>e,", vim.diagnostic.goto_prev, opts)
			vim.keymap.set("n", "<leader>e.", vim.diagnostic.goto_next, opts)

			local lspconfig = require("lspconfig")
			local lsp_capabilities = require("cmp_nvim_lsp").default_capabilities()
			local get_servers = require("mason-lspconfig").get_installed_servers()
			servers = {
				html = {
					filetypes = { "html", "php" },
				},
				emmet_ls = {
					filetypes = { "html", "css", "javascript", "typescriptreact", "javascriptreact", "php" },
				},
			}

			local server_opts = function(server)
				return vim.tbl_deep_extend("force", {
					on_attach = util.lsp_attach,
					capabilities = lsp_capabilities,
				}, servers[server] or {})
			end

			for _, server_name in ipairs(get_servers) do
				lspconfig[server_name].setup(server_opts(server_name))
			end
		end,
	},

	-- Mason
	{
		"williamboman/mason.nvim",
		cmd = "Mason",
		opts = {
			ensure_installed = {
				"stylua",
				"pyright",
				"prettierd",
			},
		},
		---@param opts MasonSettings | {ensure_installed: string[]}
		config = function(_, opts)
			require("mason").setup(opts)
			local mr = require("mason-registry")
			local function ensure_installed()
				for _, tool in ipairs(opts.ensure_installed) do
					local p = mr.get_package(tool)
					if not p:is_installed() then
						p:install()
					end
				end
			end
			if mr.refresh then
				mr.refresh(ensure_installed)
			else
				ensure_installed()
			end
		end,
	},

	-- jdtls
	{
		"mfussenegger/nvim-jdtls",
		ft = "java",
	},
}
