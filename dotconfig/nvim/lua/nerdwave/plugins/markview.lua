return {
  'OXY2DEV/markview.nvim',
  lazy = true,

  -- For blink.cmp's completion
  -- source
  dependencies = {
    'saghen/blink.cmp',
  },
  ft = { 'markdown', 'Avante', 'AvanteInput' },
  opts = {
    preview = {
      filetypes = { 'markdown', 'Avante', 'AvanteInput' },
      ignore_buftypes = {},
    },
  },
}
