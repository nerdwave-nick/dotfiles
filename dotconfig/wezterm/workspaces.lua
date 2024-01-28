local module = {}
local wezterm = require("wezterm")
local mux = wezterm.mux

local json = require("../lib/json")

local home = os.getenv("HOME") .. "/"
local defaultPath = home .. ".local/share/weztermWorkspaces.json"

local loadWorkspacesData = function()
	local file = io.open(defaultPath, "r")
	if file ~= nil then
		local jsonString = file:read("a")
		local workspaces = json.parse(jsonString)
		file:close()

		return workspaces
	else
		return
	end
end

-- theoretically this function will only be executed with an empty tab
-- this function runs assuming the following
-- -> the tab only has one single pane
-- -> this first pane can be closed right after splitting because the API of wezterm doesn't allow for a clean cd with an already created pane
local function createPanes(tab, panes, initialSize)
	local initialCols = initialSize.cols
	local initialRows = initialSize.rows
	local firstPane = tab:panes()[1]

	-- Special case
	if #panes == 1 then
		firstPane:send_text("cd " .. panes[1].cwd .. " && clear\n")
		return
	end

	local nextPane
	for paneIndex = 1, #panes - 1, 1 do
		local paneInfo = panes[paneIndex]
		local nextPaneInfo = panes[paneIndex + 1]
		local direction, size
		if paneInfo.left == nextPaneInfo.left then
			direction = "Bottom"
			size = paneInfo.height / initialRows
		else
			direction = "Right"
			size = paneInfo.width / initialCols
		end

		if paneIndex == 1 then
			nextPane = firstPane:split({ cwd = nextPaneInfo.cwd, direction = direction, size = size })
			firstPane:send_text("cd " .. paneInfo.cwd .. " && clear\n") -- hacky way to change directory for the first pane. Hopefully something better comes out
		else
			nextPane = nextPane:split({ cwd = nextPaneInfo.cwd, direction = direction, size = size })
		end
	end

	firstPane:activate()
end

-- transforms an object representing the workspaces into actual workspaces
local function createWorkspaces(data)
	local initialSize = data.size
	local workspaces = data.workspaces

	for _, workspace in ipairs(workspaces) do
		local firstTab, _, window = mux.spawn_window({
			workspace = workspace.label,
		})

		for tabIndex, tab in ipairs(workspace.tabs) do
			local newtab
			if tabIndex == 1 then
				newtab = firstTab
			else
				newtab, _, _ = window:spawn_tab({})
			end

			-- set title back only if it was explicitly set
			if #tab.label ~= 0 then
				newtab:set_title(tab.label)
			end

			createPanes(newtab, tab.panes, initialSize)
		end
	end
end

function module.loadWorkspaces()
	local data = loadWorkspacesData()
	if not data then
		return
	end
	createWorkspaces(data)
end

local function formatPanes(panes)
	local ret = {}
	for paneIndex, pane in ipairs(panes) do
		ret[paneIndex] = {}
		ret[paneIndex].height = pane.height
		ret[paneIndex].width = pane.width
		ret[paneIndex].top = pane.top
		ret[paneIndex].left = pane.left
		ret[paneIndex].cwd = pane.pane:get_current_working_dir().path
	end

	return ret
end

local function formatTabs(tabs)
	local ret = {}
	for tabIndex, tab in ipairs(tabs) do
		ret[tabIndex] = {}
		ret[tabIndex].label = tab:get_title()

		local panes = tab:panes_with_info()
		ret[tabIndex].panes = formatPanes(panes)
	end

	return ret
end

local function writeWorkspacesToJSON(workspaces)
	local file = io.open(defaultPath, "w")
	file:write(json.stringify(workspaces))
	file:close()
end

function module.saveWorkspaces()
	local windows = mux.all_windows()
	local size = windows[1]:active_tab():get_size()

	local jsonObject = { workspaces = {} } -- object to represent all the workspaces
	jsonObject.size = size
	local workspaces = jsonObject.workspaces

	for windowIndex, window in ipairs(windows) do
		workspaces[windowIndex] = {}
		workspaces[windowIndex].label = window:get_workspace()
		local tabs = window:tabs()
		workspaces[windowIndex].tabs = formatTabs(tabs)
	end
	writeWorkspacesToJSON(jsonObject)
end

return module
