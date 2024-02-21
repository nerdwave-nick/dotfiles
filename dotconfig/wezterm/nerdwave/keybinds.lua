local wezterm = require('wezterm')
local act = wezterm.action

local shortcuts = {}

local map = function(key, mods, action)
  if type(mods) == 'string' then
    table.insert(shortcuts, { key = key, mods = mods, action = action })
  elseif type(mods) == 'table' then
    for _, mod in pairs(mods) do
      table.insert(shortcuts, { key = key, mods = mod, action = action })
    end
  end
end

local function changePaneOrTab(win, direction)
  local active_tab = win:active_tab()

  -- check if we have panel in the given direction
  local available_pane = active_tab:get_pane_direction(direction)
  if available_pane ~= nil then
    available_pane:activate()
  else
    -- if no pane available the we try to switch to a tab
    local current_idx = 1
    local min_idx = 1
    local tabs = win:mux_window():tabs_with_info()
    local max_idx = #tabs

    for i, t in ipairs(tabs) do
      wezterm.log_info(i, t.tab.tab_id, t.is_active)
      if t.is_active then current_idx = i end
    end
    if direction == 'Right' then
      if current_idx + 1 <= max_idx then tabs[current_idx + 1].tab:activate() end
    elseif direction == 'Left' then
      wezterm.log_info('switch to tab: ' .. current_idx - 1)
      if current_idx - 1 >= min_idx then tabs[current_idx - 1].tab:activate() end
    end
  end
end

----------------------------------------------------------------------------------------
local default_mods = 'CTRL|SUPER'

map('6', default_mods, wezterm.action_callback(function(win, _) changePaneOrTab(win, 'Right') end))
map(';', default_mods, wezterm.action_callback(function(win, _) changePaneOrTab(win, 'Left') end))
map('3', default_mods, act.AdjustPaneSize({ 'Right', 5 }))
map('`', default_mods, act.AdjustPaneSize({ 'Left', 5 }))
map('4', default_mods, act.RotatePanes('Clockwise'))
map('5', default_mods, act.RotatePanes('CounterClockwise'))
-- spawn & close
map('c', default_mods, act.SpawnTab('CurrentPaneDomain'))
map('s', default_mods, act.SplitHorizontal({ domain = 'CurrentPaneDomain' }))
map('w', default_mods, act.CloseCurrentPane({ confirm = true }))
-- zoom states
-- copy & paste
map('c', { 'SHIFT|CTRL', 'SUPER' }, act.CopyTo('Clipboard'))
map('v', { 'SHIFT|CTRL', 'SUPER' }, act.PasteFrom('Clipboard'))
-- view
map('Enter', 'LEADER', act.ToggleFullScreen)
map('.', { default_mods, 'SUPER' }, act.DecreaseFontSize)
map('-', { default_mods, 'SUPER' }, act.IncreaseFontSize)
map('0', { default_mods, 'SUPER' }, act.ResetFontSize)
-- sessions
local sessionizer = require('nerdwave.lib.sessionizer')
map('f', 'LEADER', wezterm.action_callback(sessionizer.toggle))
map('F', 'LEADER', wezterm.action_callback(sessionizer.resetCacheAndToggle))

local keybind_settings = {
  leader = { key = 'a', mods = 'CTRL', timeout_milliseconds = 10000 },
  keys = shortcuts,
  disable_default_key_bindings = true,
}

local function setup(opts)
  for k, v in pairs(keybind_settings) do
    opts[k] = v
  end
  return opts
end
return { setup = setup }
