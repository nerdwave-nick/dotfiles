return {
  enabled = true,
  'MeanderingProgrammer/render-markdown.nvim',
  dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
  opts = {
    file_types = { 'codecompanion' },
  },
  ft = { 'codecompanion' },
}
