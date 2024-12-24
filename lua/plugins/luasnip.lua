-- Snippet engine
local Plugin = { "L3MON4D3/LuaSnip" }

Plugin.event = "InsertEnter"

Plugin.version = "v2.*"

Plugin.dependencies = {
  {
    {
      "rafamadriz/friendly-snippets",
      config = function()
        require("luasnip.loaders.from_vscode").lazy_load()
        require("luasnip.loaders.from_vscode").lazy_load({ paths = { vim.fn.stdpath("config") .. "/snippets" } })
      end,
    },
  },
}

Plugin.config = function()
  local luasnip = require("luasnip")

  luasnip.filetype_extend("dart", { "flutter" })
end

return Plugin
