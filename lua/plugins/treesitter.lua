local Plugin = { "nvim-treesitter/nvim-treesitter" }

Plugin.version = false

Plugin.event = {
	"BufReadPost",
	"BufNewFile",
	"BufWritePre",
}

Plugin.cmd = { "TSUpdateSync", "TSUpdate", "TSInstall" }

Plugin.dependencies = {
	{ "nvim-treesitter/nvim-treesitter-textobjects" },
}

Plugin.opts = {
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = { "html" },
	},
	indent = {
		enable = true,
	},
	incremental_selection = {
		enable = true,
		keymaps = {
			init_selection = "ga",
			node_incremental = "ga",
			node_decremental = "gz",
		},
	},
	textobjects = {
		select = {
			enable = true,
			lookahead = true,
			keymaps = {
				["af"] = "@function.outer",
				["if"] = "@function.inner",
				["ac"] = "@class.outer",
				["ic"] = "@class.inner",
				["ia"] = "@parameter.inner",
			},
		},
		swap = {
			enable = true,
			swap_previous = {
				["{a"] = "@parameter.inner",
			},
			swap_next = {
				["}a"] = "@parameter.inner",
			},
		},
		move = {
			enable = true,
			set_jumps = true,
			goto_next_start = {
				["]f"] = "@function.outer",
				["]c"] = "@class.outer",
				["]a"] = "@parameter.inner",
			},
			goto_next_end = {
				["]F"] = "@function.outer",
				["]C"] = "@class.outer",
			},
			goto_previous_start = {
				["[f"] = "@function.outer",
				["[c"] = "@class.outer",
				["[a"] = "@parameter.inner",
			},
			goto_previous_end = {
				["[F"] = "@function.outer",
				["[C"] = "@class.outer",
			},
		},
	},
	ensure_installed = {
		"javascript",
		"html",
		"css",
		"json",
		"lua",
	},
}

Plugin.build = ":TSUpdate"

function Plugin.init(plugin)
	require("lazy.core.loader").add_to_rtp(plugin)
	require("nvim-treesitter.query_predicates")
end

function Plugin.config(_, opts)
	require("nvim-treesitter.configs").setup(opts)
end

return Plugin
