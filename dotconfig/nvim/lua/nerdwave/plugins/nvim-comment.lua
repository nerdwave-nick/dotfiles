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
      hook = function()
        if vim.api.nvim_get_option_value('filetype', { buf = 0 }) == 'vue' then
          require('ts_context_commentstring.internal').update_commentstring()
        elseif vim.api.nvim_get_option_value('filetype', { buf = 0 }) == 'dosini' then
          vim.api.nvim_set_option_value('commentstring', '# %s', { buf = 0 })
        end
      end,
    })
  end,
}
