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
        if vim.api.nvim_buf_get_option(0, 'filetype') == 'vue' then
          require('ts_context_commentstring.internal').update_commentstring()
        elseif vim.api.nvim_buf_get_option(0, 'filetype') == 'dosini' then
          vim.api.nvim_buf_set_option(0, 'commentstring', '# %s')
        end
      end,
    })
  end,
}
