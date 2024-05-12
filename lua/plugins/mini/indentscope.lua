local Plugin = { "echasnovski/mini.indentscope" }

Plugin.event = { "BufReadPost", "BufNewFile" }
Plugin.opts = {
	options = { try_as_border = true },
}

return Plugin
