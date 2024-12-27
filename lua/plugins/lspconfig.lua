local Plugin = { "neovim/nvim-lspconfig" }

Plugin.event = { "BufReadPre", "BufNewFile" }

Plugin.cmd = { "LspInfo", "LspInstall", "LspUninstall" }

Plugin.dependencies = {
  "blink.cmp",
  "mason.nvim",
  "williamboman/mason-lspconfig.nvim",
  "mfussenegger/nvim-jdtls",
  {
    "folke/lazydev.nvim",
    ft = "lua",
    opts = {
      library = {
        { path = "${3rd}/luv/library", words = { "vim%.uv" } },
      },
    },
  },
}

Plugin.opts = {
  setup = {
    jdtls = function(_)
      vim.api.nvim_create_autocmd("FileType", {
        pattern = "java",
        callback = function()
          local config = {
            cmd = {
              "java",
            },
            root_dir = require("jdtls.setup").find_root({ "mvnw", "gradlew" }),
          }
          require("jdtls").start_or_attach(config)
        end,
      })
      return true
    end,
  },
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
  local lsp_capabilities = require("blink.cmp").get_lsp_capabilities()
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
