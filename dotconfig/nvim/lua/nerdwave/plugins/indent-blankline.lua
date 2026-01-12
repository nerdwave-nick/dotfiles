return {
  'lukas-reineke/indent-blankline.nvim',
  main = 'ibl',
  config = function()
    local ibl = require('ibl')
    local hooks = require('ibl.hooks')
    local mocha = require('catppuccin.palettes').get_palette('mocha')
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
      vim.api.nvim_set_hl(0, 'IblMauve', { fg = mocha.mauve })
      vim.api.nvim_set_hl(0, 'IblLavender', { fg = mocha.lavender })
      vim.api.nvim_set_hl(0, 'IblPink', { fg = mocha.pink })
      vim.api.nvim_set_hl(0, 'IblMaroon', { fg = mocha.maroon })
      vim.api.nvim_set_hl(0, 'IblPeach', { fg = mocha.peach })
      vim.api.nvim_set_hl(0, 'IblYellow', { fg = mocha.yellow })
      vim.api.nvim_set_hl(0, 'IblSapphire', { fg = mocha.sapphire })
      vim.api.nvim_set_hl(0, 'IblGreen', { fg = mocha.green })
      vim.api.nvim_set_hl(0, 'IblBlue', { fg = mocha.blue })
    end)
    ibl.setup({
      indent = {
        char = { '│' },
        highlight = highlight,
      },
      whitespace = {
        highlight = { 'Comment' },
      },
      scope = {
        enabled = false,
      },
    })
  end,
}
