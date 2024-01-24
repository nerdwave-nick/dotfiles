return {
  'lewis6991/gitsigns.nvim',
  config = function()
    local gitsigns = require('gitsigns')
    gitsigns.setup()
    gitsigns.toggle_current_line_blame()
  end,
}
