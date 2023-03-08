local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	spec = {
		{ import = "plugins.themes" },
		{ import = "plugins.ui" },
		{ import = "plugins.editor" },
		{ import = "plugins.coding" },
		{ import = "plugins.lsp-and-stuff" },
		{ import = "plugins.misc" },
	},
	defaults = {
		lazy = true, -- every plugin is lazy-loaded by default
		version = "*", -- try installing the latest stable version for plugins that support semver
	},
	checker = { enabled = true }, -- automatically check for plugin updates
	change_detection = {
		notify = false,
	},
	dev = {
		-- directory where you store your local plugin projects
		path = "~/Documents/nvimplug",
		---@type string[] plugins that match these patterns will use your local versions instead of being fetched from GitHub
		patterns = { "asjks" }, -- For example {"folke"}
	},
	performance = {
		rtp = {
			-- disable some rtp plugins
			disabled_plugins = {
				"gzip",
				"matchit",
				--"matchparen",
				"netrw",
				"netrwPlugin",
				"tarPlugin",
				"tohtml",
				"tutor",
				"zipPlugin",
			},
		},
	},
})
