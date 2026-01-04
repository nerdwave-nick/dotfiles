return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'franco-ruggeri/codecompanion-lualine.nvim' },
  lazy = true,
  event = 'BufRead',
  config = function()
    local custom_fname = require('lualine.components.filename'):extend()

    function custom_fname:init(options) custom_fname.super.init(self, options) end

    function custom_fname:update_status()
      local filename = vim.fn.expand('%:t')
      local filepath = vim.fn.expand('%:p')
      local cwd = vim.fn.getcwd() .. '/'

      -- Get relative path to the file from cwd
      local rel_path = filepath
      if filepath:sub(1, #cwd) == cwd then rel_path = filepath:sub(#cwd + 1) end

      -- Split the path into directories
      local dirs = {}
      for dir in string.gmatch(vim.fs.dirname(rel_path), '[^/]+') do
        table.insert(dirs, dir)
      end

      -- Create fish-style shortened path
      local shortened_dirs = {}
      for i, dir in ipairs(dirs) do
        -- First character only for directories
        if dir:len() > 0 then table.insert(shortened_dirs, dir:sub(1, 1)) end
      end

      -- Create the shortened path
      local shortened_path = table.concat(shortened_dirs, '/')
      if #shortened_path > 0 then shortened_path = shortened_path .. '/' end

      -- Get the project name for the prefix
      local dir = vim.fn.getcwd() or ''
      local projectWithoutBrackets = string.match(dir, '.+/(.+)$')
      local project = '[' .. projectWithoutBrackets .. ']'

      return project .. ' ' .. shortened_path .. filename
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
      return '\u{f085}  ' .. table.concat(c, '|')
    end

    local clients_formatter = function()
      local formatters = require('conform').list_formatters
      local c = {}
      for _, formatter in pairs(formatters()) do
        table.insert(c, formatter.name)
      end
      if #c == 0 then table.insert(c, 'fallback') end
      return '\u{f0753}  ' .. table.concat(c, '|')
    end
    -- lvim.builtin.lualine.sections.lualine_c = { current_project }
    require('lualine').setup({
      options = {
        icons_enabled = true,
        theme = 'catppuccin',
        component_separators = { left = '', right = '' },
        section_separators = { left = '', right = '' },
      },
      sections = {
        lualine_a = { 'mode', is_recording },
        lualine_b = { 'branch', 'diff', 'diagnostics' },
        lualine_c = { { custom_fname, path = 0 }, clients_lsp, clients_formatter },
        lualine_x = { 'codecompanion', 'encoding', 'fileformat', 'filetype' },
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
      refresh = {
        refresh_time = 16,
        statusline = 16,
        tabline = 100,
        winbar = 100,
      },
    })
  end,
}
