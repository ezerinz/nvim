local Plugin = { "neovim/nvim-lspconfig" }

Plugin.event = { "BufReadPre", "BufNewFile" }

Plugin.dependencies = {
  "williamboman/mason-lspconfig.nvim",
  "hrsh7th/cmp-nvim-lsp",
  { "folke/neodev.nvim", opts = {} },
}
Plugin.opts = {
  -- custom server setting
  servers = {
    lua_ls = {
      settings = {
        Lua = {
          completion = {
            callSnippet = "Replace",
          },
        },
      },
    },
  },
}

Plugin.config = function(_, opts)
  local lspconfig = require("lspconfig")
  local lsp_capabilities = require("cmp_nvim_lsp").default_capabilities()
  local get_servers = require("mason-lspconfig").get_installed_servers()

  local server_opts = function(server)
    return vim.tbl_deep_extend("force", {
      capabilities = lsp_capabilities,
    }, opts.servers[server] or {})
  end

  for _, server_name in ipairs(get_servers) do
    lspconfig[server_name].setup(server_opts(server_name))
  end
end

return Plugin
