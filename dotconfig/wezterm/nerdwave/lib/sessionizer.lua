local wezterm = require('wezterm')
local act = wezterm.action

local M = {}

local fd = ''
local rootPaths = {}

local cached = {}

M.resetCacheAndToggle = function(window, pane)
  wezterm.log_info('toggle sessionizer cache clear')
  cached = {}
  M.toggle(window, pane)
end

M.toggle = function(window, pane)
  wezterm.log_info('toggle sessionizer')
  if next(cached) == nil then
    table.insert(cached, { label = '~', id = 'default' })
    for _, path in pairs(rootPaths) do
      local success, stdout, stderr = wezterm.run_child_process({
        fd,
        '-H',
        '-I',
        '-td',
        '^.git$',
        path,
      })

      if not success then
        wezterm.log_error('Failed to run fd: ' .. stderr)
        return
      end

      for line in stdout:gmatch('([^\n]*)\n?') do
        local project = line:gsub('/.git/$', '')
        local label = project
        local id = project:gsub('.*/', '')
        if label ~= '' then table.insert(cached, { label = tostring(label), id = tostring(id) }) end
      end
    end
  end
  window:perform_action(
    act.InputSelector({
      action = wezterm.action_callback(function(win, _, id, label)
        if not id and not label then
          wezterm.log_info('Cancelled')
        else
          wezterm.log_info('Selected ' .. label)
          win:perform_action(act.SwitchToWorkspace({ name = id, spawn = { cwd = label } }), pane)
        end
      end),
      fuzzy = true,
      title = 'Select project',
      choices = cached,
    }),
    pane
  )
end

---@param sessionizer SessionizerConfig
M.setup = function(sessionizer)
  fd = sessionizer.fd
  rootPaths = sessionizer.paths
end

return M
