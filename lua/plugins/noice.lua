local Plugin = { "folke/noice.nvim" }

Plugin.dependencies = {
  "MunifTanjim/nui.nvim",
  {
    "rcarriga/nvim-notify",
    keys = {
      {
        "<leader>un",
        function()
          require("notify").dismiss({ silent = true, pending = true })
        end,
        desc = "Dismiss All Notifications",
      },
    },
  },
}

Plugin.event = "VeryLazy"

Plugin.opts = {
  routes = {
    {
      filter = {
        event = "msg_show",
        kind = "",
        find = "written",
      },
      opts = { skip = true },
    },
    {
      filter = {
        event = "msg_show",
        kind = "",
        find = "error drawing label",
      },
      opts = { skip = true },
    },
  },
  lsp = {
    override = {
      ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
      ["vim.lsp.util.stylize_markdown"] = true,
      ["cmp.entry.get_documentation"] = true,
    },
  },
  presets = {
    bottom_search = true,
    command_palette = false,
    long_message_to_split = true,
    inc_rename = true,
  },
}

return Plugin
