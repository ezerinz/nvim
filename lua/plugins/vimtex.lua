local Plugin = {
  "lervag/vimtex",
}

Plugin.lazy = false

Plugin.tag = "v2.15"

Plugin.init = function()
  vim.g.vimtex_view_method = "zathura"
end

return Plugin
