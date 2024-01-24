vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.o.cmdheight = 0
vim.o.hlsearch = true

-- vim.o.guicursor = "n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50,a:Cursor"

vim.o.signcolumn = "number"

vim.o.relativenumber = true

-- line numbers by default
vim.wo.number = true

-- mouse mode disabled
vim.o.mouse = ""

-- Sync clipboard between OS and Neovim.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.o.clipboard = "unnamedplus"

-- Enable break indent
vim.o.breakindent = true

-- Save undo history
vim.o.undofile = true

-- Case-insensitive searching UNLESS \C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Decrease update time
vim.o.updatetime = 250
vim.o.timeoutlen = 500

-- Set completeopt to have a better completion experience
vim.o.completeopt = "menuone,noselect"

-- NOTE: You should make sure your terminal supports this
vim.o.termguicolors = true

vim.o.hidden = true

vim.o.shiftwidth = 2
vim.o.tabstop = 2
vim.o.expandtab = true
vim.o.softtabstop = 2
-- vim.o.listchars = "tab:▸,eol:↲"
vim.opt.list = true

vim.api.nvim_create_autocmd('BufEnter', {
  pattern = '*',
  callback = function() require('lazygit.utils').project_root_dir() end
})
