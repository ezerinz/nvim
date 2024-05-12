local Plugin = { "nvimtools/none-ls.nvim" }

Plugin.dependencies = { "jay-babu/mason-null-ls.nvim" }

Plugin.event = { "BufReadPre", "BufNewFile" }

Plugin.config = function()
	require("mason-null-ls").setup({
		handlers = {},
	})

	require("null-ls").setup({
		on_attach = require("user.lsp").format_on_save, -- I use null ls as formatter only
	})
end

return Plugin
