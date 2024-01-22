return {
  'lewis6991/gitsigns.nvim',
  config = function()
    require('gitsigns').setup()
    vim.keymap.set('n', '<leader>tb', function()
      require('gitsigns').toggle_current_line_blame()
    end)
  end,
}
