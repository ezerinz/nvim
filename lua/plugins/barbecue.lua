local Plugin = { "utilyre/barbecue.nvim" }

Plugin.event = { "BufReadPost", "BufNewFile" }
Plugin.name = "barbecue"
Plugin.version = "*"
Plugin.dependencies = {
  "SmiteshP/nvim-navic",
  "nvim-tree/nvim-web-devicons", -- optional dependency
}
Plugin.opts = {
  exclude_filetypes = { "netrw", "toggleterm", "term" },
}

return Plugin
