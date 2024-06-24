---@alias WallpaperConfig { prefix: string, wallpapers: table }
---@alias FontConfig { size: number, family: string }
---@alias SessionizerConfig { fd: string, paths: string[] }
---@alias HostConfig { wallpaper: WallpaperConfig?, font: FontConfig, sessionizer: SessionizerConfig, initial_rows: integer?, initial_cols: integer?, statusbar: boolean?, shell: string?}

---@type table<string, HostConfig>
local hostConfigs = {
  ['persephone'] = require('nerdwave.hostconfigs.persephone'),
  ['hestia'] = require('nerdwave.hostconfigs.hestia'),
}

local function getHostConfig(hostname) return hostConfigs[hostname] end

return {
  getHostConfig = getHostConfig,
}
