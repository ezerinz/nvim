local Plugin = { "williamboman/mason.nvim" }

Plugin.cmd = "Mason"

Plugin.keys = { { "<leader>cm", "<cmd>Mason<cr>", desc = "Mason" } }

Plugin.build = ":MasonUpdate"

Plugin.opts = {
	ui = { border = "rounded" },
}

return Plugin
