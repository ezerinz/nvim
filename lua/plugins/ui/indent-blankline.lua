-- indent guides for Neovim
return {
  "lukas-reineke/indent-blankline.nvim",
  event = "BufReadPost",
  opts = {
    -- char = "▏",
    char = "│",
    filetype_exclude = { "help", "alpha", "dashboard", "neo-tree", "Trouble", "lazy" },
    show_trailing_blankline_indent = true,
    show_current_context = true,
  },
}
