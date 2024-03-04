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
		opts = {
			cmd = { "/usr/share/java/jdtls/bin/jdtls" },
			root_dir = vim.fs.dirname(vim.fs.find({ ".gradlew", ".git", "mvnw" }, { upward = true })[1]),
			on_attach = require("util").lsp_attach,
		},
		config = function(_, opts)
			require("jdtls").start_or_attach(opts)
		end,
	},

	{
		"akinsho/flutter-tools.nvim",
		event = "VeryLazy",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"stevearc/dressing.nvim", -- optional for vim.ui.select
		},
		opts = {
			fvm = true,
			widget_guides = {
				enabled = true,
			},
			dev_log = {
				open_cmd = "belowright 35 vsplit", -- command to use to open the log buffer
			},
			lsp = {
				color = {
					enabled = true,
					background = true,
					background_color = { r = 19, g = 17, b = 24 },
					virtual_text = false,
				},
				on_attach = require("util").lsp_attach,
				capabilities = require("cmp_nvim_lsp").default_capabilities(),
			},
		},
		config = function(_, opts)
			require("luasnip").filetype_extend("dart", { "flutter" })
			require("telescope").load_extension("flutter")
			require("flutter-tools").setup(opts)
		end,
	},
}
