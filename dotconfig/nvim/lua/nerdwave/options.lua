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

-- fold settings
vim.o.foldenable = true
vim.o.foldlevelstart = 99
vim.o.foldlevel= 99
vim.o.foldcolumn = '1'
vim.o.foldmethod = 'manual'

-- local view_group = vim.api.nvim_create_augroup("auto_view", { clear = true })
-- vim.api.nvim_create_autocmd({ "BufWinLeave", "BufWritePost", "WinLeave" }, {
--   desc = "Save view with mkview for real files",
--   group = view_group,
--   callback = function(args)
--     if vim.b[args.buf].view_activated then vim.cmd.mkview { mods = { emsg_silent = true } } end
--   end,
-- })
-- vim.api.nvim_create_autocmd("BufWinEnter", {
--   desc = "Try to load file view if available and enable view saving for real files",
--   group = view_group,
--   callback = function(args)
--     if not vim.b[args.buf].view_activated then
--       local filetype = vim.api.nvim_get_option_value("filetype", { buf = args.buf })
--       local buftype = vim.api.nvim_get_option_value("buftype", { buf = args.buf })
--       local ignore_filetypes = { "gitcommit", "gitrebase", "svg", "hgcommit" }
--       if buftype == "" and filetype and filetype ~= "" and not vim.tbl_contains(ignore_filetypes, filetype) then
--         vim.b[args.buf].view_activated = true
--         vim.cmd.loadview { mods = { emsg_silent = true } }
--       end
--     end
--   end,
-- })


-- mouse mode disabled
vim.o.mouse = ''

-- Enable break indent
vim.o.wrap = true
vim.o.breakindent = true
vim.o.smartindent = true
vim.o.linebreak = true
vim.o.showbreak = "  "

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

vim.o.listchars = 'tab:┊ ,trail:~,extends:>,precedes:<,nbsp:+'
vim.o.list = true

vim.api.nvim_create_autocmd('BufEnter', {
  pattern = '*',
  callback = function() require('lazygit.utils').project_root_dir() end,
})

vim.o.fillchars = 'stlnc:─,vert:│,horiz:─,stl: ,horizup:┴,horizdown:┬'
vim.o.laststatus = 3
vim.o.title = true

vim.filetype.add({ extension = { templ = 'templ' } })
