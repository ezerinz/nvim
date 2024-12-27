local Plugin = { "snacks.nvim" }

Plugin.opts = {
  indent = {
    indent = {
      hl = {
        "SnacksIndent1",
        "SnacksIndent2",
        "SnacksIndent3",
        "SnacksIndent4",
        "SnacksIndent5",
      },
    },
    scope = {
      char = "╎",
    },
  },
}

return Plugin
