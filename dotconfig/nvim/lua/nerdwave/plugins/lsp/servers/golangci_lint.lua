return {
  custom_opts = {
    cmd = { 'golangci-lint-langserver' },
    init_options = {
      command = {
        'golangci-lint',
        'run',
        '--enable-all',
        '--disable',
        'lll',
        '--out-format',
        'json',
        '--issues-exit-code=1',
      },
    },
  },
}
