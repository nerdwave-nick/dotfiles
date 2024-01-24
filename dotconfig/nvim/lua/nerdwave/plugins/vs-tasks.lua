return {
  "EthanJWright/vs-tasks.nvim",
  dependencies = {
    "nvim-lua/popup.nvim",
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim",
  },
  config = function ()
    require("vstask").setup()
    vim.keymap.set('n', '<leader>vst', function ()
      require('telescope').extensions.vstask.tasks()
    end)
  end
}
