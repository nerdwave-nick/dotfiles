return {
  "folke/zen-mode.nvim",
  config = function()
    vim.keymap.set('n', '<leader>zm', function()
      require("zen-mode").toggle()
    end)
  end
}
