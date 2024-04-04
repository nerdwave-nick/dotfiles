local cmp_setup = function()
  local t = function(str) return vim.api.nvim_replace_termcodes(str, true, true, true) end

  local border = function(hl)
    return {
      { '┌', hl },
      { '─', hl },
      { '┐', hl },
      { '│', hl },
      { '┘', hl },
      { '─', hl },
      { '└', hl },
      { '│', hl },
    }
  end

  local cmp = require('cmp')
  cmp.setup({
    preselect = cmp.PreselectMode.None,
    window = {
      completion = {
        border = border('PmenuBorder'),
        winhighlight = 'Normal:Pmenu,CursorLine:PmenuSel,Search:PmenuSel',
        scrollbar = false,
      },
      documentation = {
        border = border('CmpDocBorder'),
        winhighlight = 'Normal:CmpDoc',
      },
    },
    formatting = {
      fields = { 'abbr', 'kind', 'menu' },
      format = function(entry, vim_item)
        vim_item.menu = setmetatable({
          copilot = '[CPLT]',
          nvim_lsp = '[LSP]',
          nvim_lua = '[LUA]',
          path = '[PATH]',
          treesitter = '[TS]',
          luasnip = '[SNIP]',
          spell = '[SPELL]',
        }, {
          __index = function()
            return '[BTN]' -- builtin/unknown source names
          end,
        })[entry.source.name]

        local label = vim_item.abbr
        local truncated_label = vim.fn.strcharpart(label, 0, 80)
        if truncated_label ~= label then vim_item.abbr = truncated_label .. '...' end

        return vim_item
      end,
    },
    matching = {
      disallow_partial_fuzzy_matching = false,
    },
    performance = {
      async_budget = 1,
      max_view_entries = 10,
    },
    -- You can set mappings if you want
    mapping = {
      ['<C-CR>'] = function(fallback)
        if cmp.visible() and cmp.get_active_entry() ~= nil then
          cmp.confirm({
            select = false,
            behavior = cmp.ConfirmBehavior.Insert,
          })
        elseif require('luasnip').expand_or_locally_jumpable() then
          require('luasnip').expand_or_jump()
        else
          fallback()
        end
      end,
      ['<C-S-CR>'] = function(fallback)
        if require('luasnip').jumpable(-1) then
          require('luasnip').jump(-1)
        else
          fallback()
        end
      end,
      ['<C-t>'] = cmp.mapping.select_next_item({}),
      ['<C-n>'] = cmp.mapping.select_prev_item({}),
      ['<C-d>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-w>'] = cmp.mapping.close(),
    },
    snippet = {
      expand = function(args) require('luasnip').lsp_expand(args.body) end,
    },
    -- You should specify your *installed* sources.
    sources = {
      { name = 'nvim_lsp', max_item_count = 350 },
      { name = 'nvim_lua' },
      { name = 'luasnip' },
      { name = 'path' },
      { name = 'treesitter' },
      { name = 'buffer' },
      { name = 'copilot' },
      -- { name = "codeium" },
      -- { name = "cmp_tabnine" },
    },
    experimental = {
      ghost_text = true,
    },
  })
end

local luasnip_setup = function()
  local snippet_path = vim.fn.stdpath('config') .. '/snips/'
  if not vim.tbl_contains(vim.opt.rtp:get(), snippet_path) then vim.opt.rtp:append(snippet_path) end
  require('luasnip').setup({
    history = true,
    update_events = 'TextChanged,TextChangedI',
    delete_check_events = 'TextChanged,InsertLeave',
  })

  require('luasnip.loaders.from_lua').lazy_load()
  require('luasnip.loaders.from_vscode').lazy_load()
  require('luasnip.loaders.from_snipmate').lazy_load()
end

return {
  'hrsh7th/nvim-cmp',
  version = false,
  lazy = true,
  event = 'InsertEnter',
  config = cmp_setup,
  dependencies = {
    {
      'L3MON4D3/LuaSnip',
      dependencies = { 'rafamadriz/friendly-snippets' },
      config = luasnip_setup,
    },
    -- { "lukas-reineke/cmp-under-comparator" },
    { 'saadparwaiz1/cmp_luasnip' },
    { 'hrsh7th/cmp-nvim-lsp' },
    { 'hrsh7th/cmp-nvim-lua' },
    { 'hrsh7th/cmp-path' },
    { 'ray-x/cmp-treesitter', commit = 'c8e3a74' },
  },
}
