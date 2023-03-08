return {
	"jose-elias-alvarez/null-ls.nvim",
	event = "BufReadPre",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"jay-babu/mason-null-ls.nvim",
	},
	config = function()
		require("mason-null-ls").setup({
      automatic_installation = false,
      automatic_setup = true,
    })

    require("null-ls").setup({
      on_attach = require("util").format_on_save
    })

    require 'mason-null-ls'.setup_handlers()
	end,
}
