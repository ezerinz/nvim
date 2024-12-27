local M = {}

function M.set_inlay_hint(client, buf)
  if client.supports_method("textDocument/inlayHint") then
    vim.lsp.inlay_hint.enable(true, { bufnr = buf })
  end
end

function M.on_lsp_attach(args)
  local bufnr = args.buf
  local client = vim.lsp.get_client_by_id(args.data.client_id)

  M.set_inlay_hint(client, bufnr)

  local bufmap = function(mode, lhs, rhs)
    local opts = { buffer = bufnr }
    vim.keymap.set(mode, lhs, rhs, opts)
  end

  -- Displays hover information about the symbol under the cursor
  bufmap("n", "K", "<cmd>lua vim.lsp.buf.hover()<cr>")

  -- Jump to the definition
  bufmap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>")

  -- Jump to declaration
  bufmap("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>")

  -- Lists all the implementations for the symbol under the cursor
  bufmap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<cr>")

  -- Jumps to the definition of the type symbol
  bufmap("n", "go", "<cmd>lua vim.lsp.buf.type_definition()<cr>")

  -- Lists all the references
  bufmap("n", "gr", "<cmd>lua vim.lsp.buf.references()<cr>")

  -- Displays a function's signature information
  bufmap("n", "gs", "<cmd>lua vim.lsp.buf.signature_help()<cr>")

  -- Renames all references to the symbol under the cursor
  bufmap("n", "<F2>", "<cmd>lua vim.lsp.buf.rename()<cr>")

  -- Selects a code action available at the current cursor position
  bufmap("n", "<leader>la", "<cmd>lua vim.lsp.buf.code_action()<cr>")

  -- rename under the cursor position
  bufmap("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<cr>")

  -- Show diagnostics in a floating window
  bufmap("n", "gl", "<cmd>lua vim.diagnostic.open_float()<cr>")

  -- Move to the previous diagnostic
  bufmap("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<cr>")

  -- Move to the next diagnostic
  bufmap("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<cr>")

  -- format current buffer
  bufmap("n", "<leader>cf", '<cmd>lua require("conform").format()<cr>')
end

return M
