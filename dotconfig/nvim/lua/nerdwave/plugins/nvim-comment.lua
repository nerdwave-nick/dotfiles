return {
  'terrortylor/nvim-comment',
  config = function() require('nvim_comment').setup({ create_mappings = false, comment_empty = false }) end,
}
