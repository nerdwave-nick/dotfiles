return {
  'terrortylor/nvim-comment',
  dependencies = {
    'JoosepAlviste/nvim-ts-context-commentstring',
  },
  config = function()
    require('ts_context_commentstring').setup({
      enable_autocmd = false,
    })
    require('nvim_comment').setup({
      create_mappings = false,
      comment_empty = false,
      hook = function() require('ts_context_commentstring').update_commentstring() end,
    })
  end,
}
