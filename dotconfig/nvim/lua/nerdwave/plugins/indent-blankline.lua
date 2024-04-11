return {
  'lukas-reineke/indent-blankline.nvim',
  main = 'ibl',
  config = function()
    local ibl = require('ibl')
    local hooks = require('ibl.hooks')
    local highlight = {
      'IblBlue',
      'IblLavender',
      'IblMauve',
      'IblPink',
      'IblMaroon',
      'IblPeach',
      'IblYellow',
      'IblGreen',
      'IblSapphire',
    }

    -- create the highlight groups in the highlight setup hook, so they are reset
    -- every time the colorscheme changes
    hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
      vim.api.nvim_set_hl(0, 'IblMauve', { fg = '#CBA6F7' })
      vim.api.nvim_set_hl(0, 'IblLavender', { fg = '#b4befe' })
      vim.api.nvim_set_hl(0, 'IblPink', { fg = '#f5c2e7' })
      vim.api.nvim_set_hl(0, 'IblMaroon', { fg = '#eba0ac' })
      vim.api.nvim_set_hl(0, 'IblPeach', { fg = '#fab387' })
      vim.api.nvim_set_hl(0, 'IblYellow', { fg = '#f9e2af' })
      vim.api.nvim_set_hl(0, 'IblSapphire', { fg = '#74c7ec' })
      vim.api.nvim_set_hl(0, 'IblGreen', { fg = '#a6e3a1' })
      vim.api.nvim_set_hl(0, 'IblBlue', { fg = '#89b4fa' })
    end)
    ibl.setup({
      indent = {
        char = { '│' },
        highlight = highlight,
      },
      whitespace = {
        highlight = { 'Comment' },
      },
      scope = { enabled = false },
    })
  end,
}
