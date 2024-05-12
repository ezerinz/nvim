local Plugin = { "akinsho/flutter-tools.nvim" }

Plugin.event = "VeryLazy"

Plugin.dependencies = {
  "nvim-lua/plenary.nvim",
  "stevearc/dressing.nvim",
}

Plugin.opts = {
  fvm = true,
  widget_guides = {
    enabled = true,
  },
  lsp = {
    color = {
      enabled = true,
      background = true,
      background_color = { r = 19, g = 17, b = 24 },
      virtual_text = false,
    },
    capabilities = require("cmp_nvim_lsp").default_capabilities(),
  },
}

Plugin.config = function(_, opts)
  require("luasnip").filetype_extend("dart", { "flutter" })
  require("telescope").load_extension("flutter")
  require("flutter-tools").setup(opts)
end

return Plugin
