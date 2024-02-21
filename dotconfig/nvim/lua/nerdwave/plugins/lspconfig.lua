return {
  'neovim/nvim-lspconfig',
  event = { 'CursorHold', 'CursorHold' },
  dependencies = {
    'hrsh7th/cmp-nvim-lsp',
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
  },
  config = require('nerdwave.plugins.lsp.setup'),
}
