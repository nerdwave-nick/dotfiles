return {
  {
    "nvim-telescope/telescope-file-browser.nvim",
    dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" }
  },
  {
    'nvim-telescope/telescope.nvim', tag = '0.1.5',
      dependencies = { 'nvim-lua/plenary.nvim' },
      config = function ()
        local builtin = require('telescope.builtin')
        vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
        vim.keymap.set('n', '<C-p>', builtin.git_files, {})
        -- vim.keymap.set('n', '<leader>ps', function()
        --   builtin.grep_string({search = vim.fn.input("Grep >")})
        -- end)
        vim.keymap.set('n', '<leader>ps', builtin.live_grep, {})
        vim.keymap.set('n', '<leader>ph', builtin.help_tags, {})
        vim.keymap.set('n', '<leader>pe', ':Telescope file_browser path=%:p:h select_buffer=true<CR>', {})
      end
    },
}
