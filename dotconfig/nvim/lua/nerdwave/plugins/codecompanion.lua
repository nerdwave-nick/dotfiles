return {
  'olimorris/codecompanion.nvim',
  opts = {
    ignore_warnings = true,
    opts = {
      log_level = 'DEBUG', -- Enable verbose logging
    },
    display = {
      diff = {
        provider_opts = {
          inline = {
            layout = 'buffer', -- float|buffer - Where to display the diff
            opts = {
              context_lines = 3, -- Number of context lines in hunks
              full_width_removed = true, -- Make removed lines span full width
              show_keymap_hints = true, -- Show "gda: accept | gdr: reject" hints above diff
              show_removed = true, -- Show removed lines as virtual text
            },
          },
        },
        provider = 'inline',
      },
    },
    strategies = {
      chat = {
        adapter = 'claude_code',
      },
      inline = {
        adapter = 'vertex',
      },
      cmd = {
        adapter = 'vertex',
      },
    },
    memory = {
      enabled = true,
      opts = {
        chat = {
          ---Function to determine if memory should be added to a chat buffer
          ---This requires `enabled` to be true
          ---@param chat CodeCompanion.Chat
          ---@return boolean
          condition = function(chat) return chat.adapter.type ~= 'acp' end,
        },
      },
    },
    adapters = {
      acp = {
        codex = function()
          return require('codecompanion.adapters').extend('codex', {
            defaults = {
              auth_method = 'chatgpt',
            },
          })
        end,
        claude_code = function()
          return require('codecompanion.adapters').extend('claude_code', {
            env = {
              ANTHROPIC_API_KEY = os.getenv('ANTHROPIC_API_KEY'),
            },
          })
        end,
      },
    },
    extensions = {
      spinner = {},
      -- history = {
      --   enabled = true,
      --   opts = {
      --     keymap = 'gh',
      --     save_chat_keymap = 'sc',
      --     auto_save = true,
      --     expiration_days = 0,
      --     picker = 'telescope', --- ("telescope", "snacks", "fzf-lua", or "default")
      --     chat_filter = nil, -- function(chat_data) return boolean end
      --     picker_keymaps = {
      --       rename = { n = 'r', i = '<M-r>' },
      --       delete = { n = 'd', i = '<M-d>' },
      --       duplicate = { n = '<C-y>', i = '<C-y>' },
      --     },
      --     ---Automatically generate titles for new chats
      --     auto_generate_title = false,
      --     title_generation_opts = {},
      --     continue_last_chat = false,
      --     delete_on_clearing_chat = false,
      --     dir_to_save = vim.fn.stdpath('data') .. '/codecompanion-history',
      --     enable_logging = false,
      --     summary = {},
      --   },
      -- },
    },
  },
  dependencies = {
    'nvim-lua/plenary.nvim',
    'j-hui/fidget.nvim', -- Display status
    'echasnovski/mini.diff',
    -- 'ravitemer/codecompanion-history.nvim',
    'franco-ruggeri/codecompanion-spinner.nvim',
  },
}
