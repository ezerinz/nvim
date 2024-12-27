local Plugin = { "akinsho/bufferline.nvim" }

Plugin.event = "BufRead"

Plugin.opts = {
  options = {
    close_command = function(n)
      Snacks.bufdelete(n)
    end,
    right_mouse_command = function(n)
      Snacks.bufdelete(n)
    end,
    mode = "buffers",
    offsets = {
      { filetype = "neo-tree" },
    },
  },
  highlights = {
    buffer_selected = {
      italic = false,
    },
    indicator_selected = {
      fg = { attribute = "fg", highlight = "Function" },
      italic = false,
    },
  },
}

return Plugin
