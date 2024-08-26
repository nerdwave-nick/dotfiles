vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- vim.o.guicursor = "n:block-MiniStatusLineModeNormal,v:block-MiniStatusLineModeVisual,i:block-MiniStatusLineModeInsert"
vim.o.guicursor = 'a:TermCursor'
vim.o.cursorline = true
-- floating window via noice.nvim, so no need
vim.o.cmdheight = 0

-- hlsearch is annoying, needso to be disabled after each search, but incsearch is super useful to show if e.g. the regex is right
vim.o.hlsearch = false
vim.o.incsearch = true

vim.o.signcolumn = 'auto:1-4'

-- line numbers by default
vim.o.nu = true
vim.o.relativenumber = true

-- fold settings
vim.o.foldenable = true
vim.o.foldlevelstart = 99
vim.o.foldlevel = 99
vim.o.foldcolumn = '1'
vim.o.foldmethod = 'manual'

-- mouse mode disabled
vim.o.mouse = ''

-- Enable break indent
vim.o.wrap = true
vim.o.breakindent = true
vim.o.smartindent = true
vim.o.linebreak = true
vim.o.showbreak = '  '

-- Save undo history
vim.o.undofile = true
vim.o.undodir = os.getenv('HOME') .. '/.vim/undodir'
vim.o.swapfile = false
vim.o.backup = false

vim.o.scrolloff = 10

-- Case-insensitive searching UNLESS \C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Decrease update time
vim.o.updatetime = 250
vim.o.timeoutlen = 500

vim.o.termguicolors = true

vim.o.hidden = true

vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true

vim.o.listchars = 'tab:┊ ,trail:~,extends:>,precedes:<,nbsp:+'
vim.o.list = true

vim.api.nvim_create_autocmd('BufRead', {
  pattern = '*',
  callback = function()
    if not (vim.bo.filetype == 'oil') then require('lazygit.utils').project_root_dir() end
  end,
})

vim.o.fillchars = 'stlnc:─,vert:│,horiz:─,stl: ,horizup:┴,horizdown:┬'
vim.o.laststatus = 3
vim.o.title = true

vim.filetype.add({ extension = { templ = 'templ' } })

local yank_group = vim.api.nvim_create_augroup('HighlightYank', {})
vim.api.nvim_create_autocmd('TextYankPost', {
  group = yank_group,
  pattern = '*',
  callback = function()
    vim.highlight.on_yank({
      higroup = 'IncSearch',
      timeout = 100,
    })
  end,
})

local hl_groups = { 'DiagnosticUnderlineError','DiagnosticUnderlineWarn' }
for _, hl in ipairs(hl_groups) do
  vim.cmd.highlight(hl .. ' gui=undercurl')
end
