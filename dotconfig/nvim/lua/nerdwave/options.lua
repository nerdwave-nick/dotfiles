vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- floating window via noice.nvim, so no need
vim.o.cmdheight = 0

-- hlsearch is annoying, needso to be disabled after each search, but incsearch is super useful to show if e.g. the regex is right
vim.o.hlsearch = false
vim.o.incsearch = true

vim.o.signcolumn = 'auto:1-4'

-- line numbers by default
vim.o.nu = true
vim.o.relativenumber = true

-- mouse mode disabled
vim.o.mouse = ''

-- Enable break indent
vim.o.breakindent = true
vim.o.smartindent = true
vim.o.wrap = false

-- Save undo history
vim.o.undofile = true
vim.o.undodir = os.getenv('HOME') .. '/.vim/undodir'
vim.o.swapfile = false
vim.o.backup = false

vim.o.scrolloff = 10

-- Case-insensitive searching UNLESS \C or capital in search
-- vim.o.ignorecase = true
-- vim.o.smartcase = true

-- Decrease update time
vim.o.updatetime = 250
vim.o.timeoutlen = 500

vim.o.termguicolors = true

vim.o.hidden = true

vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true

vim.o.list = true

vim.api.nvim_create_autocmd('BufEnter', {
  pattern = '*',
  callback = function() require('lazygit.utils').project_root_dir() end,
})

vim.o.fillchars = 'stlnc:─,vert:│,horiz:─,stl: ,horizup:┴,horizdown:┬'
vim.o.laststatus = 3
vim.o.title = true
