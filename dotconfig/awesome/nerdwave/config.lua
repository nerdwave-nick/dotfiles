--- @class AwesomeWMConfig
--- @field editor string
--- @field terminal string
--- @field rawterminal string
--- @field modifier string
--- @field editor_cmd fun(AwesomeWmConfig): string

---@type string|nil
local editor = nil
---@type string|nil
local terminal = nil
---@type string|nil
local modifier = nil
---@type string|nil
local raw_terminal = nil

if awesome.hostname == 'hestia' then
  terminal = 'wezterm start --always-new-process'
  raw_terminal = 'wezterm'
end

---@type AwesomeWMConfig
local config = {
  editor = editor or 'nvim',
  terminal = terminal or 'kitty',
  rawterminal = raw_terminal or 'kitty',
  modifier = modifier or 'Mod4',
  editor_cmd = function(self) return self.terminal .. ' -e' .. self.editor end,
}
return config
