---@type HostConfig
local M = {
  shell = 'fish',
  sessionizer = {
    fd = '/usr/bin/fd',
    paths = { os.getenv('HOME') .. '/repos', os.getenv('HOME') .. '/dotfiles' },
  },
  font = {
    size = 11.80,
    cell_width = 0.9,
    -- family = 'FiraCode Nerd Font',
    -- harfbuzz_features = {
    --   'liga=0',
    --   'clig=0',
    --   'calt=0',
    --   'zero', -- 0 with a dot, cv11-cv13
    --   -- 'cv01', -- a simple
    --   'cv02', -- g simple
    --   -- "cv03", -- i 03-06
    --   -- "cv08", -- l changes 07-10
    --   'ss01', -- r simple
    --   -- "cv17", -- ~ further up
    --   'ss05', -- @ sign shape
    --   -- 'ss04', -- $ sign shape
    --   -- "cv18", -- % shape
    --   'ss03', -- & shape
    --   -- 'cv16', -- * shape
    --   -- "cv31", -- () shape
    --   -- 'cv29', -- {} shape
    --   -- "cv30", -- | shape
    -- },
    family = 'DM Mono Nerd Font',
    harfbuzz_features = {
      -- Basic features
      -- 'liga=0', -- nothnig
      -- 'clig=0', -- nothing
      -- 'calt=0', -- nothing
      -- 'kern=0', -- nothing
      -- 'rlig=1', -- nothing

      -- Number styles
      -- 'zero', -- nothing
      -- 'onum=1', -- nothing
      -- 'lnum=1', -- nothing
      -- 'tnum=1', -- nothing
      -- 'pnum=1', -- nothing

      -- Character variants
      -- 'cv01', -- nothing
      -- 'cv02', -- nothing
      -- 'cv03', -- nothing
      -- 'cv04', -- nothing
      -- 'cv05', -- nothing
      -- 'cv06', -- nothing
      -- 'cv07', -- nothing
      -- 'cv08', -- nothing
      -- 'cv09', -- nothing
      -- 'cv10', -- nothing
      -- 'cv11', -- nothing
      -- 'cv12', -- nothing
      -- 'cv13', -- nothing
      -- 'cv14', -- nothing
      -- 'cv15', -- nothing
      -- 'cv16', -- nothing
      -- 'cv17', -- nothing
      -- 'cv18', -- nothing
      -- 'cv19', -- nothing
      -- 'cv20', -- nothing
      -- 'cv21', -- nothing
      -- 'cv22', -- nothing
      -- 'cv23', -- nothing
      -- 'cv24', -- nothing
      -- 'cv25', -- nothing
      -- 'cv26', -- nothing
      -- 'cv27', -- nothing
      -- 'cv28', -- nothing
      -- 'cv29', -- nothing
      -- 'cv30', -- nothing
      -- 'cv31', -- nothing

      -- Stylistic sets
      -- 'ss01', -- nothing
      -- 'ss02', -- nothing
      -- 'ss03', -- nothing
      -- 'ss04', -- nothing
      -- 'ss05', -- f shape
      -- 'ss06', -- nothing
      -- 'ss07', -- nothing
      -- 'ss08', -- nothing
      -- 'ss09', -- nothing
      -- 'ss10', -- nothing

      -- Additional typographic features
      -- 'dlig=1', -- nothing
      -- 'hist=1', -- nothing
      -- 'salt=1', -- nothing
      -- 'swsh=1', -- nothing
      -- 'case=1', -- nothing
      -- 'smcp=1', -- nothing
      -- 'c2sc=1', -- nothing

      -- Fraction and number features
      -- 'frac=1', -- nothing
      -- 'ordn=1', -- nothing
      -- 'sups=1', -- nothing
      -- 'sinf=1', -- nothing
      -- 'dnom=1', -- nothing
      -- 'numr=1', -- nothing
    },
  },
  statusbar = true,
}

return M
