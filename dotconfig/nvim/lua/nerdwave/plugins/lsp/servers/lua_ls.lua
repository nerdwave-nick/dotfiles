return {
  custom_opts = {
    settings = {
      Lua = {
        diagnostics = {
          globals = { 'vim' },
          disable = { 'different-requires' },
        },
        workspace = {
          library = {
            '${3rd}/luv/library',
            unpack(vim.api.nvim_list_runtime_paths()),
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
