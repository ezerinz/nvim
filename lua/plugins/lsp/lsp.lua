local Plugin = { "neovim/nvim-lspconfig" }

Plugin.event = { "BufReadPre", "BufNewFile" }

Plugin.dependencies = {
	"williamboman/mason-lspconfig.nvim",
	"hrsh7th/cmp-nvim-lsp",
	"mfussenegger/nvim-jdtls",
}
Plugin.opts = {
	setup = {
		jdtls = function(_)
			vim.api.nvim_create_autocmd("FileType", {
				pattern = "java",
				callback = function()
					local config = {
						cmd = {
							"java", -- or '/path/to/java17_or_newer/bin/java'
						},
						root_dir = require("jdtls.setup").find_root({ "mvnw", "gradlew" }),
					}
					require("jdtls").start_or_attach(config)
				end,
			})
			return true
		end,
	},
	-- custom server setting
	servers = {
		lua_ls = {
			settings = {
				Lua = {
					completion = {
						callSnippet = "Replace",
					},
				},
			},
		},
	},
}

Plugin.config = function(_, opts)
	local lspconfig = require("lspconfig")
	local lsp_capabilities = require("cmp_nvim_lsp").default_capabilities()
	local get_servers = require("mason-lspconfig").get_installed_servers()

	local server_opts = function(server)
		return vim.tbl_deep_extend("force", {
			capabilities = lsp_capabilities,
		}, opts.servers[server] or {})
	end

	for _, server_name in ipairs(get_servers) do
		lspconfig[server_name].setup(server_opts(server_name))
	end
end

return Plugin
