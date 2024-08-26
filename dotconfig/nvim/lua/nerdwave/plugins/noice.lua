return {

  'folke/noice.nvim',
  event = 'VeryLazy',
  dependencies = {
    'MunifTanjim/nui.nvim',
    'rcarriga/nvim-notify',
    'nvim-telescope/telescope.nvim',
  },
  config = function()
    require('noice').setup({
      lsp = {
        -- suppress the whole no info available notification
        hover = {
          silent = true,
        },
        -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
        override = {
          ['vim.lsp.util.convert_input_to_markdown_lines'] = true,
          ['vim.lsp.util.stylize_markdown'] = true,
          ['cmp.entry.get_documentation'] = true,
        },
      },
      presets = {
        -- bottom_search = true, -- use a classic bottom cmdline for search
        command_palette = true, -- position the cmdline and popupmenu together
        long_message_to_split = true, -- long messages will be sent to a split
        inc_rename = false, -- enables an input dialog for inc-rename.nvim
        lsp_doc_border = true, -- add a border to hover docs and signature help
      },
      routes = {
        { filter = { find = 'E162' }, view = 'mini' },
        { filter = { event = 'msg_show', kind = '', find = 'written' }, view = 'mini' },
        { filter = { event = 'msg_show', kind='', find = 'search hit BOTTOM' }, view = 'mini' },
        { filter = { event = 'msg_show', kind='', find = 'search hit TOP' }, view = 'mini' },
        -- { filter = { event = 'emsg', find = 'E23' }, skip = true },
        -- { filter = { event = 'emsg', find = 'E20' }, skip = true },
        -- { filter = { find = 'E37' }, skip = true },
      },
    })
    -- require('notify').setup({
    --   background_colour = '#000000',
    -- })
    require('telescope').load_extension('noice')
  end,
}
