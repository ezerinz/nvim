local Plugin = { "ibhagwan/fzf-lua" }

Plugin.cmd = "FzfLua"

Plugin.keys = {
  { "<leader>ff", "<cmd>FzfLua files<CR>" },
  { "<leader>fg", "<cmd>FzfLua live_grep<CR>" },
  { "<leader>fr", "<cmd>FzfLua oldfiles<CR>" },
}

Plugin.dependencies = { "nvim-tree/nvim-web-devicons" }

function Plugin.config()
  require("fzf-lua").setup({ "default-title" }, {
    winopts = {
      backdrop = 100,
    },
    oldfiles = {
      include_current_session = true,
    },
  })
end

return Plugin
