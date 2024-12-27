local Plugin = { "nvim-treesitter/nvim-treesitter" }

Plugin.main = "nvim-treesitter.configs"

Plugin.version = false -- last release is way too old and doesn't work on Windows

Plugin.build = ":TSUpdate"

Plugin.event = {
  "BufReadPost",
  "BufNewFile",
  "BufWritePre",
}

Plugin.lazy = vim.fn.argc(-1) == 0 -- load treesitter early when opening a file from the cmdline

Plugin.dependencies = {
  "nvim-treesitter/nvim-treesitter-textobjects",
}

Plugin.opts = {
  auto_install = true,
  ignore_install = { "dart" },
  highlight = {
    enable = true,
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
      },
    },
  },
  ensure_installed = {
    "vim",
    "vimdoc",
  },
}

return Plugin
