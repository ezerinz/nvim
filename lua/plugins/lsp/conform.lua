local Plugin = {
	"stevearc/conform.nvim",
}
Plugin.event = { "BufWritePre" }

Plugin.dependencies = {
	"frostplexx/mason-bridge.nvim",
}

Plugin.config = function()
	local bridge = require("mason-bridge")
	require("conform").setup({
		formatters_by_ft = bridge.get_formatters(),
		format_on_save = {
			timeout_ms = 5000,
			lsp_format = "fallback",
		},
	})
end

return Plugin
