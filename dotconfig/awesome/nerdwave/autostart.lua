local awful = require('awful')

local M = {}
local function run_cmd_once(cmd)
    awful.spawn.with_shell(string.format("pgrep -u $USER -fx '%s' > /dev/null || (%s)", cmd, cmd))
end

---@type string[]
M.startup_cmds = {}

if awesome.hostname == 'persephone' then
  table.insert(M.startup_cmds, 'picom')
  table.insert(M.startup_cmds, 'vmware-user-suid-wrapper')
end

function M.run()
    for _,v in pairs(M.startup_cmds) do
       run_cmd_once(v)
    end
end

return M
