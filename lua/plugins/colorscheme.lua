local Colorscheme = { "folke/tokyonight.nvim" }

Colorscheme.lazy = false

Colorscheme.priority = 1000

Colorscheme.config = function()
  vim.cmd.colorscheme("tokyonight-night")
end

return Colorscheme
