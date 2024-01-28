local wezterm = require("wezterm")
local act = wezterm.action

local M = {}

local fd = "/usr/bin/fdfind" -- TODO: make sure you have fd installed and linked here
local rootPath = "/home/nerdwave/" -- TODO: change this to the directory where your git projects live

local cached = {}

M.resetCacheAndToggle = function(window, pane)
	cached = {}
	M.toggle(window, pane)
end

M.toggle = function(window, pane)
	local projects = {}

	if next(cached) == nil then
		local success, stdout, stderr = wezterm.run_child_process({
			fd,
			"-H",
			"-I",
			"-td",
			"^.git$",
			rootPath,
		})

		if not success then
			wezterm.log_error("Failed to run fd: " .. stderr)
			return
		end

		for line in stdout:gmatch("([^\n]*)\n?") do
			local project = line:gsub("/.git/$", "")
			local label = project
			local id = project:gsub(".*/", "")
			table.insert(projects, { label = tostring(label), id = tostring(id) })
		end
		cached = projects
	end

	window:perform_action(
		act.InputSelector({
			action = wezterm.action_callback(function(win, _, id, label)
				if not id and not label then
					wezterm.log_info("Cancelled")
				else
					wezterm.log_info("Selected " .. label)
					win:perform_action(act.SwitchToWorkspace({ name = id, spawn = { cwd = label } }), pane)
				end
			end),
			fuzzy = true,
			title = "Select project",
			choices = cached,
		}),
		pane
	)
end

return M
