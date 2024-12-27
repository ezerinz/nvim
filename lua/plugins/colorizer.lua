local Plugin = { "catgoose/nvim-colorizer.lua" }

Plugin.event = "BufReadPre"

Plugin.opts = {
  user_default_options = {
    mode = "virtualtext",
    virtualtext_inline = true,
  },
}

return Plugin
