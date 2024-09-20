local Plugin = { "nvim-flutter/flutter-tools.nvim" }

Plugin.event = "VeryLazy"

Plugin.dependencies = {
  "nvim-lua/plenary.nvim",
  "stevearc/dressing.nvim",
}

local findFlutterPath = function()
  local puro = require("user.util").load_json(vim.fn.getcwd() .. "/.puro.json")
  return puro and os.getenv("HOME") .. "/.puro/envs/" .. puro.env .. "/flutter/bin/flutter" or nil
end

Plugin.opts = {
  flutter_path = findFlutterPath(),
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
  require("flutter-tools").setup(opts)
end

return Plugin
