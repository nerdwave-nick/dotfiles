return {
  'L3MON4D3/LuaSnip',
  version = 'v2.*',
  dependencies = {
    'rafamadriz/friendly-snippets',
    'molleweide/LuaSnip-snippets.nvim',
  },
  build = 'make install_jsregexp',
  config = function()
    local luasnip = require('luasnip')
    luasnip.setup({})
    luasnip.snippets = require('luasnip_snippets').load_snippets()
    require('luasnip.loaders.from_vscode').lazy_load()
  end,
}
