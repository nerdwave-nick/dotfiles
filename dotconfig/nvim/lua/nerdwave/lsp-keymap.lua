---@diagnostic disable-next-line: unused-local
local on_attach_keymap = function(client, bufnr)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, { noremap = true, buffer = 0 })
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { noremap = true, buffer = 0 })
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, { noremap = true, buffer = 0 })
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, { noremap = true, buffer = 0 })
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, { noremap = true, buffer = 0 })
  vim.keymap.set('n', '[d', vim.diagnostic.goto_next, { noremap = true, buffer = 0 })
  vim.keymap.set('n', ']d', vim.diagnostic.goto_prev, { noremap = true, buffer = 0 })
  vim.keymap.set('n', '<leader>df', vim.diagnostic.open_float, { noremap = true, buffer = 0 })
  vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, { noremap = true, buffer = 0 })
  vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, { noremap = true, buffer = 0 })
  vim.keymap.set('i', '<C-h>', vim.lsp.buf.signature_help, { noremap = true, buffer = 0 })
end

return {
  on_attach_keymap = on_attach_keymap,
}
