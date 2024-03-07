return {
  'terrortylor/nvim-comment',
  dependencies = {
    'JoosepAlviste/nvim-ts-context-commentstring',
  },
  config = function()
    require('ts_context_commentstring').setup({})
    require('nvim_comment').setup({
      create_mappings = false,
      comment_empty = false,
      pre_hook = require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook(),
    })
  end,
}
