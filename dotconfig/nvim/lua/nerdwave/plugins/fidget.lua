return {
  'j-hui/fidget.nvim',
  lazy = false,
  tag = 'v1.6.1', -- Make sure to update this to something recent!
  opts = {
    progress = {
      display = {
        -- Icon shown when LSP progress tasks are in progress
        progress_icon = { 'dots' },
      },
    },
    notification = {
      view = {
        stack_upwards = false,
      },
      history_size = 4096,
      override_vim_notify = true,
      window = {
        normal_hl = 'Normal',
        border = 'rounded',
        winblend = 0,
        -- max_width = 30,
      },
    },
  },
}
