return {
  'saghen/blink.compat',
  -- use v2.* for blink.cmp v1.*
  version = '2.*',
  -- lazy.nvim will automatically load the plugin when it's required by blink.cmp
  lazy = true,
  -- make sure to set opts so that lazy.nvim calls blink.compat's setup
  opts = {},
}
