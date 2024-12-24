local Plugin = { "brenoprata10/nvim-highlight-colors" }

Plugin.event = "BufReadPre"
Plugin.opts = {
  render = "background",
  enable_named_colors = true,
}

return Plugin
