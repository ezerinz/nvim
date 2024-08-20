vim.api.nvim_create_autocmd("LspAttach", {
  desc = "LSP actions",
  callback = require("user.lsp").on_lsp_attach,
})

vim.api.nvim_create_autocmd("TermOpen", {
  pattern = "term://*",
  callback = require("user.terminal").set_terminal_keymaps,
})

vim.api.nvim_create_autocmd("BufEnter", {
  pattern = "term://*",
  callback = function()
    vim.fn.timer_start(1, function()
      vim.cmd("startinsert!")
    end)
  end,
})
