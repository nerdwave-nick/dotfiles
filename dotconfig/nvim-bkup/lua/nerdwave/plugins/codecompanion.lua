return {
  'olimorris/codecompanion.nvim',
  opts = {
    display = {
      chat = {
        intro_message = '🎉 CodeCompanion activated! Let\'s build something awesome together! (Press ? for sidekick options)',
        show_header_separator = true, -- Show header separators in the chat buffer? Set this to false if you're using an external markdown formatting plugin
        auto_scroll = true,
      },
    },
    strategies = {
      chat = {
        adapter = 'anthropic',
      },
      inline = {
        adapter = 'anthropic',
      },
    },
  },
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-treesitter/nvim-treesitter',
  },
}
