local awful = require('awful')
local config = require('nerdwave.config')

local M = {}
local function run_cmd_once(cmd)
  if cmd.once then
    awful.spawn.with_shell(string.format('pgrep -u $USER -fx \'%s\' > /dev/null || (%s)', cmd.cmd, cmd.cmd))
  else
    awful.spawn.with_shell(cmd.cmd)
  end
end

---@type string[]
M.startup_cmds = {}

if awesome.hostname == 'persephone' then
  table.insert(M.startup_cmds, { cmd = 'picom', once = true })
  table.insert(M.startup_cmds, { cmd = 'vmware-user-suid-wrapper', once = true })
end
if awesome.hostname == 'hestia' then
  table.insert(M.startup_cmds, { cmd = 'picom', once = true })
  table.insert(M.startup_cmds, { cmd = 'nm-applet', once = true })
  table.insert(M.startup_cmds, { cmd = 'blueman-applet', once = true })
  table.insert(M.startup_cmds, { cmd = 'vibrant-cli eDP 1.35', once = false })
end
if config.timeout.enabled then
  table.insert(M.startup_cmds, { cmd = 'xset +dpms', once = false })
  table.insert(M.startup_cmds, { cmd = 'xset s off', once = false })
  table.insert(M.startup_cmds, {
    cmd = string.format('xset dpms 0 0 %d', config.timeout.screenOffSeconds),
    once = false,
  })
  table.insert(M.startup_cmds, {
    cmd = string.format(
      'exec xautolock -time %d -bell 0 -locker lock -notify 30 -notifier "notify-send -u critical -t 10000 -- \'LOCKING screen in 30 seconds\'"',
      config.timeout.lockMinutes
    ),
    once = false,
  })
end

function M.run()
  for _, v in pairs(M.startup_cmds) do
    run_cmd_once(v)
  end
end

return M
