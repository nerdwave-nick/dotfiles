local function setup_lsp(lsp)
  local lspConf = require('nerdwave.lsp.' .. lsp)
  lspConf.capabilities = require('blink.cmp').get_lsp_capabilities(nil, true)

  vim.lsp.config(lsp, lspConf)
  vim.lsp.enable(lsp, true)
end

local function setup_lsps()
  local config_path = vim.fn.stdpath('config')
  for _, file in ipairs(vim.fn.readdir(config_path .. '/lua/nerdwave/lsp')) do
    if string.sub(file, -4) == '.lua' then
      local str = file:gsub('%.lua$', '')
      setup_lsp(str)
    else
      vim.notify('found invalid lsp file: ' .. file, vim.log.levels.WARN)
    end
  end
end

-- this sets up the lsps in the lsp subfolder automatically with the custom logic respecting my neoconf fork
setup_lsps()

local on_attach_keymap = function(bufnr)
  local map = function(mode, key, fn, desc)
    vim.keymap.set(mode, key, fn, { noremap = true, buffer = bufnr, desc = 'LSP: ' .. desc })
  end
  local telescopeBuiltin = require('telescope.builtin')

  map(
    'n',
    'K',
    function() vim.lsp.buf.hover({ silent = true, border = 'rounded' }) end,
    'Show little hover window, o[k]ay?'
  )
  map('n', 'gD', vim.lsp.buf.declaration, '[g]o to [D]eclaration')
  map('n', 'gi', telescopeBuiltin.lsp_implementations, '[g]o to [i]mplementation')
  map('n', 'gr', telescopeBuiltin.lsp_references, '[g]o to [r]eferences')
  map('n', '[d', function() vim.diagnostic.jump({ count = 1 }) end, 'next [[d]ialogue')
  map('n', ']d', function() vim.diagnostic.jump({ count = -1 }) end, 'previous []d]ialogue')
  map('n', '<leader>df', vim.diagnostic.open_float, '[d]iagnostics [f]loat')
  map('n', 'gd', telescopeBuiltin.lsp_definitions, '[g]o to [d]efinitions')
  map('n', '<leader>ds', telescopeBuiltin.lsp_document_symbols, 'find [d]ocument [s]ymbols')
  map('n', '<leader>fd', telescopeBuiltin.diagnostics, '[f]ind [d]iagnostics')
  map('n', '<leader>ca', vim.lsp.buf.code_action, '[c]ode [a]ctions')
  map('n', '<leader>rn', vim.lsp.buf.rename, '[r]e[n]ame')
  map('i', '<C-h>', function() vim.lsp.buf.signature_help({ silent = true, border = 'rounded' }) end, 'Signature Help')
end

local lsp_group = vim.api.nvim_create_augroup('CustomLspAutoGroup', {})
vim.api.nvim_create_autocmd('LspAttach', {
  group = lsp_group,
  callback = function(args)
    vim.diagnostic.config({
      virtual_text = true,
      virtual_lines = { current_line = true },
      float = {
        border = 'rounded',
      },
      underline = true,
      update_in_insert = false,
    })
    on_attach_keymap(args.buf)

    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if client == nil then return end

    -- if client:supports_method('textDocument/documentColor') then vim.lsp.document_color.enable(true, args.buf) end
    if client:supports_method('textDocument/inlayHint') then vim.lsp.inlay_hint.enable(true, { bufnr = args.buf }) end
  end,
})
