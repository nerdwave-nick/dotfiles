return {
  'nvim-treesitter/nvim-treesitter',
  lazy = true,
  event = 'BufReadPost',
  config = function()
    require('nvim-treesitter.configs').setup({
      ignore_install = {},
      sync_install = false,
      modules = {},
      ensure_installed = {
        'html',
        'css',
        'go',
        'lua',
        'typescript',
        'vue',
        'markdown',
        'markdown_inline',
      },
      auto_install = true,
      highlight = { enable = true },
      indent = { enable = true },
    })
  end,
  dependencies = {
    'OXY2DEV/markview.nvim',
  },
  build = ':TSUpdate',
}
