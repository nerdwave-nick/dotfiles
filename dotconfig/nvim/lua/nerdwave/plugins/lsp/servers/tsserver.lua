return {
  on_attach = function(client, buffnr) client.resolved_capabilities.document_formatting = false end,
  custom_opts = {
    settings = {
      documentFormatting = false,
    },
  },
}
