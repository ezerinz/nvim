local Plugin = { "smjonas/inc-rename.nvim" }

Plugin.event = "LspAttach"

Plugin.opts = {
	-- input_buffer_type = "dressing",
}

Plugin.config = function(_, opts)
	require("inc_rename").setup(opts)
end

return Plugin
