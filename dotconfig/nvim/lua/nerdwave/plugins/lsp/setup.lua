local lsp_servers = {
  lua_ls = require('nerdwave.plugins.lsp.servers.lua_ls'),
  gopls = require('nerdwave.plugins.lsp.servers.gopls'),
  bashls = require('nerdwave.plugins.lsp.servers.bashls'),
  eslint = require('nerdwave.plugins.lsp.servers.eslint'),
  tsserver = require('nerdwave.plugins.lsp.servers.tsserver'),
}
local set_lsp_keymap = require('nerdwave.lsp-keymap').on_attach_keymap
local lsp_config_setup = function()
  require('mason').setup({})
  require('mason-lspconfig').setup({
    ensure_installed = {
      'bashls',
      'eslint',
      'lua_ls',
      'rust_analyzer',
      'tsserver',
    },
  })
  vim.lsp.handlers['textDocument/publishDiagnostics'] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
    signs = true,
    underline = true,
    virtual_text = true,
    severity_limit = 'Hint',
    update_in_insert = true,
  })
  local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())
  local opts = {
    capabilities = capabilities,
  }
  local nvim_lsp = require('lspconfig')
  local function mason_lsp_handler(lsp_name)
    local custom_handler = {}
    if lsp_servers[lsp_name] ~= nil then
      custom_handler = lsp_servers[lsp_name].custom_opts
      if lsp_servers[lsp_name].on_attach ~= nil then
        opts.on_attach = function(client, buffnr)
          lsp_servers[lsp_name].on_attach(client, buffnr)
          set_lsp_keymap(client, buffnr)
        end
      else
        opts.on_attach = set_lsp_keymap
      end
    end
    nvim_lsp[lsp_name].setup(vim.tbl_deep_extend('force', opts, custom_handler))
  end

  require('mason-lspconfig').setup_handlers({ mason_lsp_handler })
  vim.api.nvim_command([[LspStart]])
end

return lsp_config_setup
