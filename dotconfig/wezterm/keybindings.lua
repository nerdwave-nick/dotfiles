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
			if t.is_active then
				current_idx = i
			end
		end
		if direction == "Right" then
			if current_idx + 1 <= max_idx then
				tabs[current_idx + 1].tab:activate()
			end
		elseif direction == "Left" then
			wezterm.log_info("switch to tab: " .. current_idx - 1)
			if current_idx - 1 >= min_idx then
				tabs[current_idx - 1].tab:activate()
			end
		end
	end
end

local function serializeWorkspaces(ws)
	local tmp = " [\n"
	for i, w in ipairs(ws) do
		tmp = tmp .. "\t" .. w .. ",\n"
	end
	tmp = tmp .. "]"
	return tmp
end

local function serializeTable(val, name, skipnewlines, depth)
	skipnewlines = skipnewlines or false
	depth = depth or 0

	local tmp = string.rep(" ", depth)

	if name then
		tmp = tmp .. name .. " = "
	end

	if type(val) == "table" then
		tmp = tmp .. "{" .. (not skipnewlines and "\n" or "")

		for k, v in pairs(val) do
			tmp = tmp .. serializeTable(v, k, skipnewlines, depth + 1) .. "," .. (not skipnewlines and "\n" or "")
		end

		tmp = tmp .. string.rep(" ", depth) .. "}"
	elseif type(val) == "number" then
		tmp = tmp .. tostring(val)
	elseif type(val) == "string" then
		tmp = tmp .. string.format("%q", val)
	elseif type(val) == "boolean" then
		tmp = tmp .. (val and "true" or "false")
	else
		tmp = tmp .. '"[inserializeable datatype:' .. type(val) .. ']"'
	end

	return tmp
end

----------------------------------------------------------------------------------------

map(
	"6",
	{ "CTRL|ALT" },
	wezterm.action_callback(function(win, _)
		changePaneOrTab(win, "Right")
	end)
)
map(
	";",
	{ "CTRL|ALT" },
	wezterm.action_callback(function(win, _)
		changePaneOrTab(win, "Left")
	end)
)
map("3", "CTRL|ALT", act.AdjustPaneSize({ "Right", 5 }))
map("`", "CTRL|ALT", act.AdjustPaneSize({ "Left", 5 }))
map("4", "CTRL|ALT", act.RotatePanes("Clockwise"))
map("5", "CTRL|ALT", act.RotatePanes("CounterClockwise"))
-- spawn & close
map("c", "CTRL|ALT", act.SpawnTab("CurrentPaneDomain"))
map("s", "CTRL|ALT", act.SplitHorizontal({ domain = "CurrentPaneDomain" }))
map("w", "CTRL|ALT", act.CloseCurrentPane({ confirm = true }))
-- zoom states
-- copy & paste
map("c", { "SHIFT|CTRL", "SUPER" }, act.CopyTo("Clipboard"))
map("v", { "SHIFT|CTRL", "SUPER" }, act.PasteFrom("Clipboard"))
-- view
map("Enter", "CTRL|ALT", act.ToggleFullScreen)
map(".", { "CTRL|ALT", "SUPER" }, act.DecreaseFontSize)
map("-", { "CTRL|ALT", "SUPER" }, act.IncreaseFontSize)
map("0", { "CTRL|ALT", "SUPER" }, act.ResetFontSize)
-- sessions
map(
	"r",
	"LEADER",
	act.PromptInputLine({
		description = "Enter new name for tab",
		action = wezterm.action_callback(function(window, pane, line)
			if line then
				window:active_tab():set_title(line)
			end
		end),
	})
)
map(
	"l",
	"LEADER",
	act.PromptInputLine({
		description = wezterm.format({
			{ Attribute = { Intensity = "Bold" } },
			{ Text = "Enter name for new workspace" },
		}),
		action = wezterm.action_callback(function(window, pane, line)
			if line then
				window:perform_action(wezterm.mux.rename_workspace(wezterm.mux.get_active_workspace(), line), pane)
			end
		end),
	})
)
map("s", "LEADER", wezterm.action.ShowLauncherArgs({ flags = "FUZZY|WORKSPACES" }))
map("p", "LEADER", wezterm.action.EmitEvent("save-workspaces"))
return {
	leader = { key = "a", mods = "CTRL", timeout_milliseconds = 5000 },
	keys = shortcuts,
	disable_default_key_bindings = true,
	-- key_tables = key_tables,
}
