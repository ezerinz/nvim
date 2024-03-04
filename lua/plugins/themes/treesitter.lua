return {
	{
		"nvim-treesitter/nvim-treesitter",
		version = false,
		event = { "BufReadPost", "BufNewFile" },
		build = function()
			local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
			ts_update()
		end,
		config = function()
			local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
			-- parser_config.hypr = {
			-- 	install_info = {
			-- 		url = "https://github.com/luckasRanarison/tree-sitter-hypr",
			-- 		files = { "src/parser.c" },
			-- 		branch = "master",
			-- 	},
			-- 	filetype = { "hypr" },
			-- }

			require("nvim-treesitter.configs").setup({
				ensure_installed = {
					"python",
					"lua",
					"css",
					"html",
					"java",
					"javascript",
					"dart",
				},
				highlight = {
					enable = true,
					additional_vim_regex_highlighting = false,
					disable = function(lang, buf)
						local max_filesize = 100 * 1024 -- 100 KB
						local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
						if ok and stats and stats.size > max_filesize then
							return true
						end
					end,
				},
				autotag = {
					enable = true,
				},
			})
		end,
	},
	{ "luckasRanarison/tree-sitter-hypr", event = "VeryLazy" },
}
