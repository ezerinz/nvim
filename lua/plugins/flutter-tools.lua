local Plugin = { "nvim-flutter/flutter-tools.nvim" }

Plugin.ft = "dart"

Plugin.dependencies = {
  "nvim-lua/plenary.nvim",
  "stevearc/dressing.nvim",
  "saghen/blink.cmp",
}

local findFlutterPath = function()
  local puro = require("user.utils").load_json(vim.fn.getcwd() .. "/.puro.json")
  return puro and os.getenv("HOME") .. "/.puro/envs/" .. puro.env .. "/flutter/bin/flutter" or nil
end

function Plugin.opts()
  return {
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
      capabilities = require("blink.cmp").get_lsp_capabilities(),
    },
  }
end

return Plugin
