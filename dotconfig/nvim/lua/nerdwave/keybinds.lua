-- SETUP
local format_with_notif = function()
    local callback = function(err, did_edit)
        if err ~= nil then
            vim.notify(err, vim.log.levels.ERROR, { title = "Formatting failed" })
            return
        end
        if did_edit then
            vim.notify("Formatted", vim.log.levels.INFO, { title = "Formatting succeeded" })
        else
            vim.notify("No changes occurred", vim.log.levels.INFO, { title = "Formatting succeeded" })
        end
    end
    require("conform").format({ lsp_fallback = true }, callback)
end

-- ###########################################################################################
-- KEYMAP ####################################################################################

----------
-- General

-- move line up/down
vim.keymap.set("n", "<M-Up>", ":m-2<CR>", { silent = true, noremap = true })
vim.keymap.set("n", "<M-Down>", ":m+1<CR>", { silent = true, noremap = true })
vim.keymap.set("n", "<M-k>", ":m-2<CR>", { silent = true, noremap = true })
vim.keymap.set("n", "<M-j>", ":m+1<CR>", { silent = true, noremap = true })
-- move selection up/down
vim.keymap.set("v", "<M-Up>", ":m '<-2<CR>vgv=vgv", { silent = true, noremap = false })
vim.keymap.set("v", "<M-Down>", ":m '>+1<CR>vgv=vgv", { silent = true, noremap = true })
vim.keymap.set("v", "<M-k>", ":m '<-2<CR>vgv=vgv", { silent = true, noremap = true })
vim.keymap.set("n", "<M-j>", ":m '>+1<CR>vgv=vgv", { silent = true, noremap = true })
-- formatting
vim.keymap.set("n", "<leader>ff", format_with_notif, { noremap = true })
-- pane navigation, spllitting, etc
vim.keymap.set("n", "<C-M-;>", "<C-w>h", { noremap = true })
vim.keymap.set("n", "<C-M-6>", "<C-w>l", { noremap = true })
vim.keymap.set("n", "<C-M-5>", "<C-w>k", { noremap = true })
vim.keymap.set("n", "<C-M-4>", "<C-w>j", { noremap = true })
-- resizing
vim.keymap.set("n", "<C-M-`>", "<C-w><", { noremap = true })
vim.keymap.set("n", "<C-M-3>", "<C-w>>", { noremap = true })
vim.keymap.set("n", "<C-M-2>", "<C-w>+", { noremap = true })
vim.keymap.set("n", "<C-M-1>", "<C-w>-", { noremap = true })
-- creating and closing splits
vim.keymap.set("n", "<C-M-s>", "<C-w>v<C-w>l", { noremap = true })
vim.keymap.set("n", "<C-M-c>", "<C-w>s<C-w>k", { noremap = true })
vim.keymap.set("n", "<C-M-w>", "<C-w>q", { noremap = true })
vim.keymap.set("n", "<C-M-9>", "<C-w>_", { noremap = true })
vim.keymap.set("n", "<C-M-8>", "<C-w>|", { noremap = true })
vim.keymap.set("n", "<C-M-7>", "<C-w>=", { noremap = true })
-- terminal mode
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>", { noremap = true })
-- yoinks
vim.keymap.set({ 'n', 'v' }, '<leader>y', [["+y]])
vim.keymap.set({ 'n', 'v' }, '<leader>Y', [["+Y]])
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])
-- the name is the 'these are pretty neat'-agen
vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
-- take care of te devil
vim.keymap.set("n", "Q", "<nop>")

----------
-- Plugins

local telescope = require("telescope")
local harpoon = require("harpoon")
local telescopeBuiltin = require("telescope.builtin")

-- vstask
vim.keymap.set("n", "<leader>vt", function()
    telescope.extensions.vstask.task()
end)
-- undotree
vim.keymap.set("n", "<leader>ut", vim.cmd.UndotreeToggle)
-- harpoon
vim.keymap.set("n", "<leader>a", function()
    harpoon:list():append()
end)
vim.keymap.set("n", "<C-e>", function()
    harpoon.ui:toggle_quick_menu(harpoon:list())
end)
vim.keymap.set("n", "<C-h>", function()
    harpoon:list():select(1)
end)
vim.keymap.set("n", "<C-t>", function()
    harpoon:list():select(2)
end)
vim.keymap.set("n", "<C-n>", function()
    harpoon:list():select(3)
end)
vim.keymap.set("n", "<C-s>", function()
    harpoon:list():select(4)
end)
-- lazygit
vim.keymap.set("n", "<leader>gg", function()
    telescope.extensions.lazygit.lazygit()
end)
-- nvim-comment
vim.keymap.set("n", "<leader>/", vim.cmd.CommentToggle)
vim.keymap.set("v", "<leader>/", ":'<,'>CommentToggle<CR>vgv", { silent = true, noremap = true })
-- zen-mode
vim.keymap.set("n", "<leader>zm", function()
    require("zen-mode").toggle()
end)
-- gitsigns
vim.keymap.set("n", "<leader>tb", function()
    require("gitsigns").toggle_current_line_blame()
end)
-- telescope
vim.keymap.set("n", "<leader>pf", telescopeBuiltin.find_files)
vim.keymap.set("n", "<leader>pp", function()
    telescopeBuiltin.find_files({ hidden = true })
end)
vim.keymap.set("n", "<C-p>", telescopeBuiltin.git_files)
-- vim.keymap.set("n",'<leader>ps', function() telescopeBuiltin.grep_string({search = vim.fn.input("Grep >")}) end)
vim.keymap.set("n", "<leader>ps", telescopeBuiltin.live_grep)
vim.keymap.set("n", "<leader>ph", telescopeBuiltin.help_tags)
vim.keymap.set("n", "<leader>pe", ":Telescope file_browser path=%:p:h select_buffer=true<CR>")
vim.keymap.set("n", "<leader>pn", ":Telescope noice<CR>")
