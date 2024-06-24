local awful = require('awful')

local M = {}
local function run_cmd_once(cmd)
  awful.spawn.with_shell(string.format('pgrep -u $USER -fx \'%s\' > /dev/null || (%s)', cmd, cmd))
end

---@type string[]
M.startup_cmds = {}

if awesome.hostname == 'persephone' then
  table.insert(M.startup_cmds, 'picom')
  table.insert(M.startup_cmds, 'vmware-user-suid-wrapper')
end
if awesome.hostname == 'hestia' then
  table.insert(M.startup_cmds, 'picom')
  table.insert(M.startup_cmds, 'nm-applet')
  table.insert(M.startup_cmds, 'blueman-applet')
  table.insert(M.startup_cmds, 'vibrant-cli eDP 1.35')
  table.insert(
    M.startup_cmds,
    'xautolock -time 3 -locker lock -notify 30 -notifier "notify-send -u critical -t 10000 -- \'LOCKING screen in 15 seconds\'"'
  )
end

function M.run()
  for _, v in pairs(M.startup_cmds) do
    run_cmd_once(v)
  end
end

return M
