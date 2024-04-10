local wezterm = require('wezterm')
local M = {}

M.config = {
  dividers = 'slant_left',
  indicator = {
    leader = {
      enabled = true,
      off = ' ',
      on = ' ',
    },
    mode = {
      enabled = true,
      names = {
        resize_mode = 'RESIZE',
        copy_mode = 'VISUAL',
        search_mode = 'SEARCH',
      },
    },
  },
  tabs = {
    numerals = 'arabic',
    pane_count = 'superscript',
    brackets = {
      active = { '', ':' },
      inactive = { '', ':' },
    },
  },
  clock = {
    enabled = true,
    format = '%H:%M',
  },
  workspace = {
    enabled = true,
  },
}

local C = {}

M.setup = function(opts)
  opts.use_fancy_tab_bar = false
  opts.tab_bar_at_bottom = true
  opts.tab_max_width = 30
  opts.hide_tab_bar_if_only_one_tab = false
  opts.enable_tab_bar = true

  local dividers = {
    slant_right = {
      left = utf8.char(0xe0be),
      right = utf8.char(0xe0bc),
    },
    slant_left = {
      left = utf8.char(0xe0ba),
      right = utf8.char(0xe0b8),
    },
    arrows = {
      left = utf8.char(0xe0b2),
      right = utf8.char(0xe0b0),
    },
    rounded = {
      left = utf8.char(0xe0b6),
      right = utf8.char(0xe0b4),
    },
  }

  C.div = {
    l = '',
    r = '',
  }
  if M.config.dividers then
    C.div.l = dividers[M.config.dividers].left
    C.div.r = dividers[M.config.dividers].right
  end

  C.leader = {
    enabled = M.config.indicator.leader.enabled or true,
    off = M.config.indicator.leader.off,
    on = M.config.indicator.leader.on,
  }

  C.mode = {
    enabled = M.config.indicator.mode.enabled,
    names = M.config.indicator.mode.names,
  }

  C.tabs = {
    numerals = M.config.tabs.numerals,
    pane_count_style = M.config.tabs.pane_count,
    brackets = {
      active = M.config.tabs.brackets.active,
      inactive = M.config.tabs.brackets.inactive,
    },
  }

  C.clock = {
    enabled = M.config.clock.enabled,
    format = M.config.clock.format,
  }

  C.p = (M.config.dividers == 'rounded') and '' or ' '

  wezterm.log_info(C)
  return opts
end

-- superscript/subscript
local function numberStyle(number, script)
  local scripts = {
    superscript = {
      '⁰',
      '¹',
      '²',
      '³',
      '⁴',
      '⁵',
      '⁶',
      '⁷',
      '⁸',
      '⁹',
    },
    subscript = {
      '₀',
      '₁',
      '₂',
      '₃',
      '₄',
      '₅',
      '₆',
      '₇',
      '₈',
      '₉',
    },
  }
  local numbers = scripts[script]
  local number_string = tostring(number)
  local result = ''
  for i = 1, #number_string do
    local char = number_string:sub(i, i)
    local num = tonumber(char)
    if num then
      result = result .. numbers[num + 1]
    else
      result = result .. char
    end
  end
  return result
end

local roman_numerals = {
  'Ⅰ',
  'Ⅱ',
  'Ⅲ',
  'Ⅳ',
  'Ⅴ',
  'Ⅵ',
  'Ⅶ',
  'Ⅷ',
  'Ⅸ',
  'Ⅹ',
  'Ⅺ',
  'Ⅻ',
}

-- custom tab bar
wezterm.on('format-tab-title', function(tab, tabs, panes, config, hover, max_width)
  local colours = config.resolved_palette.tab_bar

  local active_tab_index = 0
  for _, t in ipairs(tabs) do
    if t.is_active == true then active_tab_index = t.tab_index end
  end

  local rainbow = {
    config.resolved_palette.ansi[2],
    config.resolved_palette.indexed[16],
    config.resolved_palette.ansi[4],
    config.resolved_palette.ansi[3],
    config.resolved_palette.ansi[7],
    config.resolved_palette.ansi[5],
  }

  local i = tab.tab_index % 6
  local tab_rgb = rainbow[i + 1]
  local inactive_tab_bg = colours.inactive_tab.bg_color
  local active_tab_bg = colours.new_tab.bg_color

  local s_bg, s_fg, e_bg, e_fg

  -- the last tab
  if tab.tab_index == #tabs - 1 then
    if tab.is_active then
      s_bg = active_tab_bg
      s_fg = tab_rgb
      e_bg = active_tab_bg
      e_fg = active_tab_bg
    else
      s_bg = inactive_tab_bg
      s_fg = tab_rgb
      e_bg = active_tab_bg
      e_fg = inactive_tab_bg
    end
  elseif tab.tab_index == active_tab_index - 1 then
    s_bg = inactive_tab_bg
    s_fg = tab_rgb
    e_bg = active_tab_bg
    e_fg = inactive_tab_bg
  elseif tab.is_active then
    s_bg = active_tab_bg
    s_fg = tab_rgb
    e_bg = inactive_tab_bg
    e_fg = active_tab_bg
  else
    s_bg = inactive_tab_bg
    s_fg = tab_rgb
    e_bg = inactive_tab_bg
    e_fg = inactive_tab_bg
  end

  local pane_count = ''
  if C.tabs.pane_count_style then
    local tabi = wezterm.mux.get_tab(tab.tab_id)
    local muxpanes = tabi:panes()
    local count = #muxpanes == 1 and '' or tostring(#muxpanes)
    pane_count = numberStyle(count, C.tabs.pane_count_style)
  end

  local index_i, index
  if C.tabs.numerals == 'roman' then
    index_i = roman_numerals[tab.tab_index + 1]
  else
    index_i = tab.tab_index + 1
  end

  if tab.is_active then
    index = string.format('%s%s%s ', C.tabs.brackets.active[1], index_i, C.tabs.brackets.active[2])
  else
    index = string.format('%s%s%s ', C.tabs.brackets.inactive[1], index_i, C.tabs.brackets.inactive[2])
  end

  -- start and end hardcoded numbers are the Powerline + " " padding
  local fillerwidth = 2 + string.len(index) + string.len(pane_count) + 2

  local tabtitle = tab.tab_title
  if tabtitle == nil or tabtitle == '' then
    tabtitle = tab.active_pane.title
    -- tabtitle = wezterm.mux.get_active_workspace()
  end
  local width = config.tab_max_width - fillerwidth - 1
  if (#tabtitle + fillerwidth) > config.tab_max_width then
    tabtitle = wezterm.truncate_right(tabtitle, width) .. '…'
  end

  local title = string.format(' %s%s%s%s', index, tabtitle, pane_count, C.p)

  return {
    { Background = { Color = s_bg } },
    { Foreground = { Color = s_fg } },
    { Text = title },
    { Background = { Color = e_bg } },
    { Foreground = { Color = e_fg } },
    { Text = C.div.r },
  }
end)

-- custom status
wezterm.on('update-status', function(window, pane)
  local active_kt = window:active_key_table() ~= nil
  local show = C.leader.enabled or (active_kt and C.mode.enabled)
  if not show then
    window:set_left_status('')
    return
  end

  local palette = window:effective_config().resolved_palette

  local leader = ''
  if C.leader.enabled then
    local leader_text = C.leader.off
    if window:leader_is_active() then leader_text = C.leader.on end
    leader = wezterm.format({
      { Foreground = { Color = palette.ansi[5] } },
      { Background = { Color = palette.background } },
      { Text = ' ' .. leader_text .. C.p },
    })
  end

  local first_tab_active = window:mux_window():tabs_with_info()[1].is_active
  local divider_bg = first_tab_active and palette.tab_bar.new_tab.bg_color or palette.tab_bar.inactive_tab.bg_color

  local divider = wezterm.format({
    { Foreground = { Color = palette.background } },
    { Background = { Color = divider_bg } },
    { Text = C.div.r },
  })

  local workspace = wezterm.format({
    { Foreground = { Color = palette.ansi[5] } },
    { Background = { Color = palette.background } },
    { Text = ' ws:' },
    { Attribute = { Intensity = 'Bold' } },
    { Text = wezterm.mux.get_active_workspace() .. C.p },
    'ResetAttributes',
  })

  window:set_left_status(leader .. workspace .. divider)

  if C.clock.enabled then
    local time = wezterm.time.now():format(C.clock.format)
    window:set_right_status(wezterm.format({
      { Background = { Color = palette.tab_bar.background } },
      { Foreground = { Color = palette.ansi[5] } },
      { Attribute = { Intensity = 'Bold' } },
      { Text = time },
      'ResetAttributes',
    }))
  end
end)

return M
