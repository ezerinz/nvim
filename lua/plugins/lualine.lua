local Plugin = { "nvim-lualine/lualine.nvim" }

Plugin.event = "VeryLazy"

Plugin.dependencies = { "nvim-tree/nvim-web-devicons" }

Plugin.opts = {
  options = {
    theme = "auto",
    disabled_filetypes = {
      statusline = { "alpha", "dashboard", "lazy" },
    },
    section_separators = { left = "", right = "" },
    component_separators = { left = "", right = "" },
    globalstatus = true,
  },
  sections = {
    lualine_x = {
      {
        require("noice").api.statusline.mode.get,
        cond = require("noice").api.statusline.mode.has,
        color = { fg = "#ff9e64" },
      },
      "encoding",
      "fileformat",
      "filetype",
    },
  },
}

return Plugin
