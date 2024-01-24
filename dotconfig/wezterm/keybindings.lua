local wezterm = require("wezterm")
local act = wezterm.action

local shortcuts = {}

local map = function(key, mods, action)
  if type(mods) == "string" then
    table.insert(shortcuts, { key = key, mods = mods, action = action })
  elseif type(mods) == "table" then
    for _, mod in pairs(mods) do
      table.insert(shortcuts, { key = key, mods = mod, action = action })
    end
  end
end

local function changePaneOrTab (win, direction)
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
      if t.is_active then
        current_idx = i
      end
    end
    if direction == "Right" then
      if current_idx + 1 <= max_idx then
        tabs[current_idx + 1].tab:activate()
      end
    elseif direction == "Left" then
      wezterm.log_info('switch to tab: ' .. current_idx - 1)
      if current_idx - 1 >= min_idx then
        tabs[current_idx - 1].tab:activate()
      end
    end
  end
end
-- map 1-9 to switch to tab 1-9, 0 for the last tab
for i = 1, 3 do
  map(tostring(i), { "CTRL|ALT" }, act.ActivateTab(i - 1))
end
map("0", { "CTRL|ALT" }, act.ActivateTab(-1))
map("6", { "CTRL|ALT" }, wezterm.action_callback(function(win, _) changePaneOrTab(win, 'Right') end))
map(";", { "CTRL|ALT" }, wezterm.action_callback(function (win, _) changePaneOrTab(win, 'Left') end))
map("^", { "CTRL|ALT" }, act.AdjustPaneSize({ "Right", 5 }))
map(":", { "CTRL|ALT" }, act.AdjustPaneSize({ "Left", 5 }))
map("%", { "CTRL|ALT" }, act.RotatePanes("Clockwise"))
map("$", { "CTRL|ALT" }, act.RotatePanes("CounterClockwise"))
-- spawn & close
map("c", "CTRL|ALT", act.SpawnTab("CurrentPaneDomain"))
map("s", "CTRL|ALT", act.SplitHorizontal({domain = "CurrentPaneDomain"}))
-- map("x", "CTRL|ALT", act.CloseCurrentPane({ confirm = true }))
-- map("t", { "SHIFT|CTRL", "SUPER" }, act.SpawnTab("CurrentPaneDomain"))
map("w", { "CTRL|ALT" }, act.CloseCurrentPane({ confirm = true }))
-- map("n", { "SHIFT|CTRL", "SUPER" }, act.SpawnWindow)
-- zoom states
-- map("z", { "LEADER", "SUPER" }, act.TogglePaneZoomState)
-- map("Z", { "LEADER", "SUPER" }, toggleTabBar)
-- copy & paste
-- map("v", "LEADER", act.ActivateCopyMode)
map("c", { "SHIFT|CTRL", "SUPER" }, act.CopyTo("Clipboard"))
map("v", { "SHIFT|CTRL", "SUPER" }, act.PasteFrom("Clipboard"))
-- map("f", { "SHIFT|CTRL", "SUPER" }, act.Search("CurrentSelectionOrEmptyString"))
-- rotation
-- map("e", { "LEADER", "SUPER" }, act.RotatePanes("Clockwise"))
-- pickers
-- map(" ", "LEADER", act.QuickSelect)
-- map("o", { "LEADER", "SUPER" }, openUrl)
-- map("p", { "LEADER", "SUPER" }, act.PaneSelect({ alphabet = "asdfghjkl;" }))
-- map("R", { "LEADER", "SUPER" }, act.ReloadConfiguration)
-- map("u", "SHIFT|CTRL", act.CharSelect)
-- map("p", { "SHIFT|CTRL", "SHIFT|SUPER" }, act.ActivateCommandPalette)
-- view
map("Enter", "ALT", act.ToggleFullScreen)
-- map("-", { "CTRL", "SUPER" }, act.DecreaseFontSize)
-- map("=", { "CTRL", "SUPER" }, act.IncreaseFontSize)
-- map("0", { "CTRL", "SUPER" }, act.ResetFontSize)
-- switch fonts
-- map("f", "LEADER", act.EmitEvent("switch-font"))
-- debug
-- map("l", "SHIFT|CTRL", act.ShowDebugOverlay)

-- map(
--   "r",
--   { "LEADER", "SUPER" },
--   act.ActivateKeyTable({
--     name = "resize_mode",
--     one_shot = false,
--   })

-- local key_tables = {
--   resize_mode = {
--     { key = "h", action = act.AdjustPaneSize({ "Left", 1 }) },
--     { key = "j", action = act.AdjustPaneSize({ "Down", 1 }) },
--     { key = "k", action = act.AdjustPaneSize({ "Up", 1 }) },
--     { key = "l", action = act.AdjustPaneSize({ "Right", 1 }) },
--     { key = "LeftArrow", action = act.AdjustPaneSize({ "Left", 1 }) },
--     { key = "DownArrow", action = act.AdjustPaneSize({ "Down", 1 }) },
--     { key = "UpArrow", action = act.AdjustPaneSize({ "Up", 1 }) },
--     { key = "RightArrow", action = act.AdjustPaneSize({ "Right", 1 }) },
--   },
-- }

-- add a common escape sequence to all key tables
-- for k, _ in pairs(key_tables) do
--   table.insert(key_tables[k], { key = "Escape", action = "PopKeyTable" })
--   table.insert(key_tables[k], { key = "Enter", action = "PopKeyTable" })
--   table.insert(
--     key_tables[k],
--     { key = "c", mods = "CTRL", action = "PopKeyTable" }
--   )
-- end

return {
  leader = { key = "a", mods = "CTRL", timeout_milliseconds = 5000 },
  keys = shortcuts,
  disable_default_key_bindings = true,
  -- key_tables = key_tables,
}
