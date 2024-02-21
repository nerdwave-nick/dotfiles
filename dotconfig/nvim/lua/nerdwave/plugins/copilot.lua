return {
  'zbirenbaum/copilot.lua',
  cmd = 'Copilot',
  event = 'InsertEnter',
  opts = {
    cmp = {
      enabled = true,
      method = 'getCompletionsCycling',
    },
    panel = {
      enabled = false,
    },
    suggestion = {
      enabled = false,
    },
    filetypes = {
      ['dap-repl'] = false,
      ['big_file_disabled_ft'] = false,
    },
  },
  dependencies = {
    {
      'zbirenbaum/copilot-cmp',
      opts = {},
    },
  },
}
