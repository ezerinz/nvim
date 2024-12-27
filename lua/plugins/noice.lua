local Plugin = { "folke/noice.nvim" }

Plugin.event = "VeryLazy"

Plugin.dependencies = {
  "MunifTanjim/nui.nvim",
}

Plugin.opts = {
  popupmenu = {
    enabled = false,
  },
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
    progress = {
      enabled = false,
    },
    override = {
      ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
      ["vim.lsp.util.stylize_markdown"] = true,
    },
  },
  presets = {
    bottom_search = true,
    command_palette = false,
    long_message_to_split = true,
    inc_rename = false,
    lsp_doc_border = true,
  },
}

return Plugin
