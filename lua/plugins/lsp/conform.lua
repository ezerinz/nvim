local Plugin = { "stevearc/conform.nvim" }

Plugin.cmd = { "ConformInfo" }
Plugin.event = { "BufWritePre", "InsertLeave" }
Plugin.config = function()
  local bridge = require("mason-bridge")

  local slow_format_filetypes = { "dart" }
  require("conform").setup({
    formatters_by_ft = bridge.get_formatters(),
    format_on_save = function(bufnr)
      require("conform").formatters_by_ft = bridge.get_formatters()
      if slow_format_filetypes[vim.bo[bufnr].filetype] then
        return
      end
      local function on_format(err)
        if err and err:match("timeout$") then
          slow_format_filetypes[vim.bo[bufnr].filetype] = true
        end
      end

      return { timeout_ms = 200, lsp_fallback = true }, on_format
    end,
    format_after_save = function(bufnr)
      if not slow_format_filetypes[vim.bo[bufnr].filetype] then
        return
      end
      return { lsp_fallback = true }
    end,
  })
end

return Plugin
