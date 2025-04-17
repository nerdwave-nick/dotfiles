return {
  'folke/todo-comments.nvim',
  dependencies = { 'nvim-lua/plenary.nvim' },
  opts = {
    highlight = {
      pattern = [[.*<(KEYWORDS):\s*]], -- pattern or table of patterns, used for highlighting (vim regex)
      comments_only = true, -- uses treesitter to match keywords in comments only
      multiline = false, -- don't highlight multiline comments
    },
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
    search = {
      pattern = [[\b(KEYWORDS):\b]], -- match without the extra colon. You'll likely get false positives
    },
  },
}
