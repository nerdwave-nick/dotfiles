return {
  'nvim-treesitter/nvim-treesitter',
  lazy = false,
  build = ':TSUpdate',
  config = function()
    local langs = {
      'go',
      'lua',
      'python',
      'rust',
      'typescript',
      'yaml',
      'markdown',
      'json',
      'html',
      'css',
      'javascript',
      'make',
      'bash',
      'vim',
      'query',
      'sql',
      'toml',
      'dockerfile',
      'regex',
      'gomod',
      'markdown_inline',
      'just',
    }
    local ts = require('nvim-treesitter')
    vim.api.nvim_create_autocmd('FileType', {
      pattern = langs,
      callback = function()
        vim.treesitter.start()
        vim.wo[0][0].foldexpr = 'v:lua.vim.treesitter.foldexpr()'
        vim.wo[0][0].foldmethod = 'expr'
      end,
    })
    ts.install(langs)
  end,
}
