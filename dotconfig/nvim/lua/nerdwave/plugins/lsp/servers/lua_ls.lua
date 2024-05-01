return {
  custom_opts = {
    settings = {
      Lua = {
        diagnostics = {
          globals = {
            -- nvim
            'vim',
            -- awesome
            'awesome',
            'client',
            'screen',
            'root',
          },
          disable = { 'different-requires' },
        },
        workspace = {
          library = {
            '${3rd}/luv/library',
            unpack(vim.api.nvim_list_runtime_paths()),
            '/usr/share/awesome/lib',
          },
        },
        format = {
          enable = false,
        },
        telemetry = { enable = false },
        semantic = { enable = true },
      },
    },
  },
}
