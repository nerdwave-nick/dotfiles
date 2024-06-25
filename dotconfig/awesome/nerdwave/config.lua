--- @class AwesomeWMConfig
--- @field editor string
--- @field terminal string
--- @field rawterminal string
--- @field wallpaper string
--- @field modifier string
--- @field editor_cmd fun(AwesomeWmConfig): string
--- @field timeout TimeoutSettings

--- @alias TimeoutSettings { enabled: boolean, lockMinutes:integer, screenOffSeconds:integer }

---@type string|nil
local editor = nil
---@type string|nil
local terminal = nil
---@type string|nil
local modifier = nil
---@type string|nil
local raw_terminal = nil
---@type string|nil
local wallpaper = nil
---@type TimeoutSettings | nil
local timeout = nil

if awesome.hostname == 'hestia' then
  terminal = 'wezterm start --always-new-process'
  raw_terminal = 'wezterm'
  local wallpaper_table = {
    -- '~/dotfiles/feh/images/cherry_blossoms.jpg',
    '~/dotfiles/feh/images/shaded_landscape.jpg',
    '~/dotfiles/feh/images/forrest.png',
    '~/dotfiles/feh/images/salty_mountains.png',
  }
  wallpaper = wallpaper_table[math.random(#wallpaper_table)]
  local lockMinutes = 3
  local lockSeconds = lockMinutes * 60
  timeout = { enabled = true, lockMinutes = lockMinutes, screenOffSeconds = lockSeconds + 30 }
end

---@type AwesomeWMConfig
local config = {
  editor = editor or 'nvim',
  terminal = terminal or 'kitty',
  rawterminal = raw_terminal or 'kitty',
  modifier = modifier or 'Mod4',
  wallpaper = wallpaper or '~/dotfiles/feh/images/cherry_blossoms.jpg',
  editor_cmd = function(self) return self.terminal .. ' -e' .. self.editor end,
  timeout = timeout or { enabled = false, lockMinutes = 0, screenOffSeconds = 0 },
}
return config
