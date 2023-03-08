return {
  'VonHeikemen/searchbox.nvim',
  dependencies = {
    'MunifTanjim/nui.nvim'
  },
  keys = {
    {'<leader>zz', ':SearchBoxIncSearch<CR>'},
    {'<leader>zr', ':SearchBoxReplace<CR>'}
  },
  config = function()
    require('searchbox').setup({
      popup = {
        win_options = {
          winhighlight = 'Normal:Normal,FloatBorder:Normal'
        }
      }
    })
  end
}
