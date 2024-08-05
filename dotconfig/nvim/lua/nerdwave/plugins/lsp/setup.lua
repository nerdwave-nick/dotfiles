local lsp_servers = {
  lua_ls = require('nerdwave.plugins.lsp.servers.lua_ls'),
  gopls = require('nerdwave.plugins.lsp.servers.gopls'),
  bashls = require('nerdwave.plugins.lsp.servers.bashls'),
  eslint = require('nerdwave.plugins.lsp.servers.eslint'),
  tsserver = require('nerdwave.plugins.lsp.servers.tsserver'),
  volar = require('nerdwave.plugins.lsp.servers.volar'),
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
      'volar@1.8.27'
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
  capabilities.textDocument.foldingRange = {
    dynamicRegistration = false,
    lineFoldingOnly = true,
  }
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
  local ufohandler = function(virtText, lnum, endLnum, width, truncate)
    local newVirtText = {}
    local suffix = (' 󰁂 %d '):format(endLnum - lnum)
    local sufWidth = vim.fn.strdisplaywidth(suffix)
    local targetWidth = width - sufWidth
    local curWidth = 0
    for _, chunk in ipairs(virtText) do
      local chunkText = chunk[1]
      local chunkWidth = vim.fn.strdisplaywidth(chunkText)
      if targetWidth > curWidth + chunkWidth then
        table.insert(newVirtText, chunk)
      else
        chunkText = truncate(chunkText, targetWidth - curWidth)
        local hlGroup = chunk[2]
        table.insert(newVirtText, { chunkText, hlGroup })
        chunkWidth = vim.fn.strdisplaywidth(chunkText)
        -- str width returned from truncate() may less than 2nd argument, need padding
        if curWidth + chunkWidth < targetWidth then
          suffix = suffix .. (' '):rep(targetWidth - curWidth - chunkWidth)
        end
        break
      end
      curWidth = curWidth + chunkWidth
    end
    table.insert(newVirtText, { suffix, 'MoreMsg' })
    return newVirtText
  end

  require('ufo').setup({ fold_virt_text_handler = ufohandler })
end

return lsp_config_setup
