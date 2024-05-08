---@diagnostic disable-next-line: unused-local
local on_attach_keymap = function(client, bufnr)
  local map = function(mode, key, fn, desc)
    vim.keymap.set(mode, key, fn, { noremap = true, buffer = bufnr, desc = 'LSP: ' .. desc })
  end
  local telescopeBuiltin = require('telescope.builtin')
  local function peekOrHover()
    local winid = require('ufo').peekFoldedLinesUnderCursor()
    if winid then
      -- local bufnr = vim.api.nvim_win_get_buf(winid)
      local keys = { 'a', 'i', 'o', 'A', 'I', 'O', 'gd', 'gr' }
      for _, k in ipairs(keys) do
        -- Add a prefix key to fire `trace` action,
        -- if Neovim is 0.8.0 before, remap yourself
        vim.keymap.set('n', k, '<CR>' .. k, { noremap = false, buffer = bufnr })
      end
    else
      vim.lsp.buf.hover()
    end
  end
  map('n', 'K', peekOrHover, 'Show little hover window, o[k]ay?')
  map('n', 'gD', vim.lsp.buf.declaration, '[g]o to [D]eclaration')
  map('n', 'gi', telescopeBuiltin.lsp_implementations, '[g]o to [i]mplementation')
  map('n', 'gr', telescopeBuiltin.lsp_references, '[g]o to [r]eferences')
  map('n', '[d', vim.diagnostic.goto_next, 'next [[d]ialogue')
  map('n', ']d', vim.diagnostic.goto_prev, 'previous []d]ialogue')
  map('n', '<leader>df', vim.diagnostic.open_float, '[d]iagnostics [f]loat')
  map('n', 'gd', telescopeBuiltin.lsp_definitions, '[g]o to [d]efinitions')
  map('n', '<leader>ds', telescopeBuiltin.lsp_document_symbols, 'find [d]ocument [s]ymbols')
  map('n', '<leader>fd', telescopeBuiltin.diagnostics, '[f]ind [d]iagnostics')
  map('n', '<leader>ca', vim.lsp.buf.code_action, '[c]ode [a]ctions')
  map('n', '<leader>rn', vim.lsp.buf.rename, '[r]e[n]ame')
  map('i', '<C-h>', vim.lsp.buf.signature_help, 'Signature Help')
end

return {
  on_attach_keymap = on_attach_keymap,
}
