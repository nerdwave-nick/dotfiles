return {
  'nvim-lualine/lualine.nvim',
  lazy = true,
  event = 'BufRead',
  config = function()
    local function filename_plus_project()
      local dir = vim.fn.getcwd() or ''
      local buffer_dir = vim.fn.expand('%')
      local project = '[' .. string.match(dir, '.+/(.+)$') .. ']'
      local relative_path = buffer_dir:gsub(dir, '')
      local modified_suffix = ''
      if vim.bo.modified then modified_suffix = '[+]' end
      return project .. ' ' .. relative_path .. ' ' .. modified_suffix
    end

    local is_recording = function()
      local reg = vim.fn.reg_recording()
      if reg == '' then return '' end -- not recording
      return 'MACRO >> ' .. reg
    end
    local clients_lsp = function()
      local bufnr = vim.api.nvim_get_current_buf()

      local clients = vim.lsp.get_clients({ bufnr = bufnr })
      if next(clients) == nil then return '' end

      local c = {}
      for _, client in pairs(clients) do
        table.insert(c, client.name)
      end
      return '\u{f085} ' .. table.concat(c, '|')
    end

    local clients_formatter = function()
      local formatters = require('conform').list_formatters
      local c = {}
      for _, formatter in pairs(formatters()) do
        table.insert(c, formatter.name)
      end
      if #c == 0 then table.insert(c, 'fallback') end
      return '\u{f0753} ' .. table.concat(c, '|')
    end
    -- lvim.builtin.lualine.sections.lualine_c = { current_project }
    require('lualine').setup({
      options = {
        icons_enabled = true,
        theme = 'catppuccin',
        component_separators = { left = '', right = '' },
        section_separators = { left = '', right = '' },
      },
      sections = {
        lualine_a = { 'mode', is_recording },
        lualine_b = { 'branch', 'diff', 'diagnostics' },
        lualine_c = { filename_plus_project, clients_lsp, clients_formatter },
        lualine_x = { 'encoding', 'fileformat', 'filetype' },
        lualine_y = { 'progress' },
        lualine_z = { 'location' },
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { 'filename' },
        lualine_x = { 'location' },
        lualine_y = {},
        lualine_z = {},
      },
      tabline = {},
      winbar = {},
      inactive_winbar = {},
      extensions = {},
    })
  end,
}
