return {
  custom_opts = {
    settings = {
      Lua = {
        diagnostics = {
          globals = {
            -- nvim
            -- awesome
          },
          disable = { 'different-requires' },
        },
        workspace = {
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
