local beautiful = require('beautiful')
local dpi = beautiful.xresources.apply_dpi

--- @class AwesomeWMConfig
--- @field gaps number|nil
--- @field editor string
--- @field terminal string
--- @field modifier string
--- @field editor_cmd fun(AwesomeWmConfig): string

---@type AwesomeWMConfig
local config = {
  gaps = dpi(7),
  editor = os.getenv('EDITOR') or 'nvim',
  terminal = 'kitty',
  modifier = 'Mod4',
  editor_cmd = function(self) return self.terminal .. ' -e' .. self.editor end,
}
return config
