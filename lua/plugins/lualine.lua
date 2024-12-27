local Plugin = { "nvim-lualine/lualine.nvim" }

Plugin.event = "VeryLazy"

Plugin.dependencies = { "nvim-tree/nvim-web-devicons" }

function Plugin.opts()
  return {
    options = {
      theme = "auto",
      disabled_filetypes = {
        statusline = { "snacks_dashboard", "lazy" },
      },
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
end

return Plugin
