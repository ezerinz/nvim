local Plugin = { "stefanboca/venv-selector.nvim" }

Plugin.branch = "sb/push-rlpxsqmllxtz"

Plugin.cmd = { "VenvSelect" }

Plugin.keys = {
  {
    "<leader>pe",
    "<cmd>VenvSelect<CR>",
    desc = "Python venv picker",
  },
}

Plugin.opts = {}

return Plugin
