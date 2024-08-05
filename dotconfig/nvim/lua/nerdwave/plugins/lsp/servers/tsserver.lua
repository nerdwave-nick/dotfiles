return {
  on_attach = function(client, buffnr) client.server_capabilities.document_formatting = false end,
  custom_opts = {
    settings = {
      documentFormatting = false,
    },
    filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue' },
  },
}
