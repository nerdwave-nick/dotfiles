local M = {}

M.formatter_by_file_type = {
  rust = { 'rustfmt' },
  typescript = { 'prettierd', 'prettier', 'eslint_d', 'eslint', stop_after_first = true },
  vue = { 'prettierd', 'prettier', 'eslint_d', 'eslint', stop_after_first = true },
  go = { 'golangci-lint' },
  lua = { 'stylua' },
  zig = { 'zigfmt' },
  sql = { 'sql-formatter', 'sqlfmt', stop_after_first = true },
  kdl = { 'kdlfmt' },
  json = { lsp_fallback = true },
  markdown = { 'mdfmt', 'markdownfmt', lsp_fallback = true, stop_after_first = true },
  -- qml = { 'qmlformat', stop_after_first = true },
}

M.format_with_notif = function()
  local callback = function(err, did_edit)
    if err ~= nil then
      vim.notify(err, vim.log.levels.ERROR, { title = 'Formatting failed' })
      return
    end
    if did_edit then
      vim.notify('Formatted', vim.log.levels.INFO, { title = 'Formatting succeeded' })
    else
      vim.notify('No changes occurred', vim.log.levels.DEBUG, { title = 'Formatting succeeded' })
    end
  end
  require('conform').format({ timeout_ms = 1500, lsp_fallback = true }, callback)
end

return M
