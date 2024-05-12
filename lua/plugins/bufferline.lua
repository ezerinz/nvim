local Plugin = { "akinsho/bufferline.nvim" }

Plugin.event = { "BufRead" }

Plugin.dependencies = { "nvim-tree/nvim-web-devicons" }

Plugin.opts = {
  options = {
    diagnostics = "nvim_lsp",
    offsets = {
      {
        filetype = "neo-tree",
        text = "File Explorer",
        text_align = "center",
        separator = true,
      },
    },
    show_buffer_close_icons = false,
    show_close_icon = false,
  },
  highlights = {
    offset_separator = {
      bg = "None",
      fg = vim.api.nvim_get_hl(0, {
        name = "NeoTreeNormal",
      }).bg,
    },
  },
}

return Plugin
