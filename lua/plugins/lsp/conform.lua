local Plugin = {
  "stevearc/conform.nvim",
}

Plugin.event = { "BufWritePre" }

Plugin.config = function()
  require("conform").setup({
    formatters_by_ft = {
      lua = { "stylua" },
      html = { "prettierd" },
      css = { "prettierd" },
      javascript = { "prettierd" },
      scss = { "prettierd" },
      json = { "prettierd" },
      python = { "black" },
    },
    format_on_save = {
      timeout_ms = 200,
      lsp_format = "fallback",
    },
  })
end

return Plugin
