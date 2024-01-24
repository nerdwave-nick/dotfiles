-- SETUP
local mapn = function (keys, func, opts)
  if opts == nil then
    opts= {noremap = true}
  end
  vim.keymap.set('n', keys, func, opts)
end

-- ###########################################################################################
-- KEYMAP ####################################################################################

local telescope = require("telescope")
local harpoon = require("harpoon")
local telescopeBuiltin = require('telescope.builtin')

-- vstask
mapn('<leader>vt', function () telescope.extensions.vstask.task() end)
-- undotree
mapn('<leader>ut', vim.cmd.UndotreeToggle)
-- harpoon
mapn("<leader>a", function() harpoon:list():append() end)
mapn("<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)
mapn("<C-h>", function() harpoon:list():select(1) end)
mapn("<C-t>", function() harpoon:list():select(2) end)
mapn("<C-n>", function() harpoon:list():select(3) end)
mapn("<C-s>", function() harpoon:list():select(4) end)
-- lazygit
mapn('<leader>gg', function () telescope.extensions.lazygit.lazygit() end)
-- nvim-comment
mapn('<leader>/', vim.cmd.CommentToggle)
-- zen-mode
mapn('<leader>zm', function() require('zen-mode').toggle() end)
-- gitsigns
mapn('<leader>tb', function() require('gitsigns').toggle_current_line_blame() end)
-- telescope
mapn('<leader>pf', telescopeBuiltin.find_files)
mapn('<leader>pp', function() telescopeBuiltin.find_files({hidden=true}) end)
mapn('<C-p>', telescopeBuiltin.git_files)
-- mapn('<leader>ps', function() telescopeBuiltin.grep_string({search = vim.fn.input("Grep >")}) end)
mapn('<leader>ps', telescopeBuiltin.live_grep)
mapn('<leader>ph', telescopeBuiltin.help_tags)
mapn('<leader>pe', ':Telescope file_browser path=%:p:h select_buffer=true<CR>')
mapn('<leader>pn', ':Telescope noice<CR>')
