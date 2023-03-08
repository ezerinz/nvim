return {
	{
		"neovim/nvim-lspconfig",
		event = "BufReadPre",
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

			require("mason").setup()
			local lspconfig = require("lspconfig")
			local lsp_capabilities = require("cmp_nvim_lsp").default_capabilities()
			local get_servers = require("mason-lspconfig").get_installed_servers()
			pengaturan = {
				html = { "html", "php" },
			}

			for _, server_name in ipairs(get_servers) do
				lspconfig[server_name].setup({
					on_attach = util.lsp_attach,
					capabilities = lsp_capabilities,
					filetypes = pengaturan[server_name],
				})
			end
		end,
	},

	-- Mason
	{
		"williamboman/mason.nvim",
		cmd = "Mason",
		config = true,
	},

	-- jdtls
	{
		"mfussenegger/nvim-jdtls",
		ft = "java",
	},
}
