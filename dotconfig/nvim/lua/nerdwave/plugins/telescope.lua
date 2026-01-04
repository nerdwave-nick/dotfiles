return {
  {
    'nvim-telescope/telescope.nvim',
    tag = 'v0.2.0',
    dependencies = { 'nvim-lua/plenary.nvim' },
  },
  {
    'nvim-telescope/telescope-ui-select.nvim',
    dependencies = { 'nvim-telescope/telescope.nvim' },
    config = function()
      require('telescope').load_extension('fidget')
      require('telescope').load_extension('ui-select')
    end,
  },
}
