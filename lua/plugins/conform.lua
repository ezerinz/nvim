-- formatter plugin
local Plugin = { "stevearc/conform.nvim" }

Plugin.event = { "BufWritePre", "InsertLeave" }

Plugin.cmd = { "ConformInfo" }

Plugin.dependencies = {
  "mason.nvim",
  "mason-bridge.nvim",
}

function Plugin.config()
  require("conform").setup({
    formatters_by_ft = require("mason-bridge").get_formatters(),
    format_on_save = {
      timeout_ms = 500,
      lsp_format = "fallback",
    },
  })
end

return Plugin
