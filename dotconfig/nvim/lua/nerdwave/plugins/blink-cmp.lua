return {
  'saghen/blink.cmp',
  dependencies = {
    'L3MON4D3/LuaSnip',
    'moyiz/blink-emoji.nvim',
    'MahanRahmati/blink-nerdfont.nvim',
    'xzbdmw/colorful-menu.nvim',
    'saghen/blink.compat',
    'Kaiser-Yang/blink-cmp-avante',
  },
  lazy = false,
  version = '1.*',
  opts = {
    keymap = {
      preset = 'none',
      ['<C-space>'] = nil,
      ['<C-e>'] = nil,
      ['<C-y>'] = nil,
      ['<Up>'] = nil,
      ['<Down>'] = nil,
      ['<C-p>'] = nil,
      ['<C-b>'] = nil,
      ['<C-f>'] = nil,
      ['<Tab>'] = nil,
      ['<S-Tab>'] = nil,

      ['<C-CR>'] = { 'accept', 'fallback' },

      ['<C-Right>'] = { 'snippet_forward' },
      ['<C-Left>'] = { 'snippet_backward' },

      ['<C-k>'] = { 'show_signature', 'hide_signature', 'fallback' },

      ['<C-n>'] = { 'select_prev', 'fallback' },
      ['<C-t>'] = { 'select_next', 'fallback' },

      ['<C-Up>'] = { 'scroll_documentation_up', 'fallback' },
      ['<C-Down>'] = { 'scroll_documentation_down', 'fallback' },
    },
    appearance = {
      nerd_font_variant = 'mono',
    },
    sources = {
      default = {
        'lsp',
        'buffer',
        'snippets',
        'path',
        -- 'supermaven',
      },
      providers = {
        -- create provider
        supermaven = {
          name = 'supermaven',
          module = 'blink.compat.source',
        },
        nerdfont = {
          module = 'blink-nerdfont',
          name = 'Nerd Fonts',
          score_offset = 15, -- Tune by preference
          opts = { insert = true }, -- Insert nerdfont icon (default) or complete its name
        },
        emoji = {
          module = 'blink-emoji',
          name = 'Emoji',
          score_offset = 15, -- Tune by preference
          opts = { insert = true }, -- Insert emoji (default) or complete its name
        },
      },
    },
    completion = {
      accept = {
        dot_repeat = false,
        auto_brackets = {
          enabled = false,
        },
      },
      keyword = {
        range = 'prefix',
      },
      list = {
        selection = {
          preselect = false,
          auto_insert = false,
        },
      },
      menu = {
        border = 'rounded',
        winhighlight = 'Normal:Normal,FloatBorder:FloatBorder,CursorLine:TelescopeSelection,Search:None',
        draw = {
          -- We don't need label_description now because label and label_description are already
          -- combined together in label by colorful-menu.nvim.
          columns = { { 'kind_icon' }, { 'label', gap = 1 } },
          components = {
            label = {
              text = function(ctx) return require('colorful-menu').blink_components_text(ctx) end,
              highlight = function(ctx) return require('colorful-menu').blink_components_highlight(ctx) end,
            },
          },
        },
        auto_show = true,
      },
      documentation = {
        window = {
          min_width = 10,
          max_width = 80,
          max_height = 20,
          border = 'rounded',
          winblend = 0,
          winhighlight = 'Normal:Normal,FloatBorder:FloatBorder,EndOfBuffer:LspDiagnosticUnderlineWarning',
          scrollbar = true,
          direction_priority = {
            menu_north = { 'e', 'w', 'n', 's' },
            menu_south = { 'e', 'w', 's', 'n' },
          },
        },
        auto_show = true,
      },
      ghost_text = {
        -- currently bug in blink, waiting for fix
        -- see https://github.com/Saghen/blink.cmp/issues/1648
        enabled = false,
      },
    },
    fuzzy = {
      sorts = {
        'exact',
        'score',
        'sort_text',
      },
    },
    signature = {
      enabled = true,
      window = {
        border = 'rounded',
      },
    },
    snippets = { preset = 'luasnip' },
  },
}
