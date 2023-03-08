return {
  'nvim-treesitter/nvim-treesitter',
  event = "BufReadPost",
  build = function()
    local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
    ts_update()
  end,
  config = function()
    require('nvim-treesitter.configs').setup {
      ensure_installed = {
        "python",
        "lua",
        "css",
        "html",
        "dart",
        "java",
        "javascript",
        "dart"
      },
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      }
    }
  end,
}
