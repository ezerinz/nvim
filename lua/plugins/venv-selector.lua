local Plugin = { 'linux-cultist/venv-selector.nvim' };

Plugin.dependencies = { 'neovim/nvim-lspconfig', 'nvim-telescope/telescope.nvim', 'mfussenegger/nvim-dap-python' }
Plugin.branch = 'regexp'
Plugin.opts = {}

Plugin.event = 'VeryLazy'
Plugin.keys = {
	-- Keymap to open VenvSelector to pick a venv.
	{ '<leader>vs', '<cmd>VenvSelect<cr>' },
	-- Keymap to retrieve the venv from a cache (the one previously used for the same project directory).
	{ '<leader>vc', '<cmd>VenvSelectCached<cr>' },
}

return Plugin
