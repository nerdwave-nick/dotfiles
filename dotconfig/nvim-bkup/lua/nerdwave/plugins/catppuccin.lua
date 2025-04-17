return {
  'catppuccin/nvim',
  priority = 1000,
  config = function()
    require('catppuccin').setup({
      custom_highlights = function()
        return {
          Comment = { fg = '#545d7d' },
          DiagnosticUnderlineError = { style = { 'undercurl' } },
          DiagnosticUnderlineWarn = { style = { 'undercurl' } },
          LspDiagnosticUnderlineError = { style = { 'undercurl' } },
          LspDiagnosticUnderlineWarning = { style = { 'undercurl' } },
          TreesitterContextSeparator = { fg = '#45475a' },
        }
      end,
      flavour = 'mocha', -- latte, frappe, macchiato, mocha
      background = { -- :h background
        light = 'latte',
        dark = 'mocha',
      },
      -- transparent_background = true, -- disables setting the background color.
      show_end_of_buffer = false, -- shows the '~' characters after the end of buffers
      term_colors = true, -- sets terminal colors (e.g. `g:terminal_color_0`)
      dim_inactive = {
        enabled = true, -- dims the background color of inactive window
        shade = 'dark',
        percentage = 0.55, -- percentage of the shade to apply to the inactive window
      },
      native_lsp = {
        enabled = true,
        virtual_text = {
          errors = { 'italic' },
          hints = { 'italic' },
          warnings = { 'italic' },
          information = { 'italic' },
        },
        underlines = {
          errors = { 'undercurl' },
          hints = { 'underline' },
          warnings = { 'undercurl' },
          information = { 'underline' },
        },
        inlay_hints = {
          background = true,
        },
      },
      integrations = {
        cmp = true,
        treesitter = true,
        treesitter_context = true,
        notify = true,
        harpoon = true,
        mason = true,
        render_markdown = true,
        telescope = { enabled = true },
        lsp_trouble = true,
        which_key = true,
        gitsigns = true,
        indent_blankline = {
          enabled = true,
          scope_color = 'lavender', -- catppuccin color (eg. `lavender`) Default: text
          colored_indent_levels = true,
        },
      },
    })
    vim.cmd('colorscheme catppuccin')
  end,
}
