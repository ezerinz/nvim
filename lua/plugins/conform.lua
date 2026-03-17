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
    formatters_by_ft = vim.tbl_extend("force", require("mason-bridge").get_formatters(), {
      jsonc = { "prettierd", "prettier", stop_after_first = true },
      astro = { "prettierd", "prettier", stop_after_first = true },
      blade = { "blade-formatter", stop_after_first = true },
    }),
    format_on_save = {
      timeout_ms = 10000,
      lsp_format = "fallback",
    },
  })
end

return Plugin
