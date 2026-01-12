return {
  'nerdwave-nick/neoconf.nvim',
  enabled = true,
  lazy = false,
  config = function()
    require('neoconf').setup({
      local_settings = '.neoconf.json',
      global_settings = 'neoconf.json',
      filetype_jsonc = true,
    })
  end,
}
