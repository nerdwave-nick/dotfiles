return {
  custom_opts = {
    cmd = { 'golangci-lint-langserver' },
    init_options = {
      command = {
        'golangci-lint',
        'run',
        '--disable',
        'lll',
      },
    },
  },
}
