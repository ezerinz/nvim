return {
	"ahmedkhalf/project.nvim",
	event = "BufReadPost",
	config = function()
		require("project_nvim").setup({
			detection_methods = { "lsp", "pattern" },
			patterns = { "gradlew", ".git", "_darcs", ".hg", ".bzr", ".svn", "Makefile" },
			ignore_lsp = {},
			exclude_dirs = {},
			show_hidden = false,
			silent_chdir = true,
			scope_chdir = "global",
			datapath = vim.fn.stdpath("data"),
		})
	end,
}
