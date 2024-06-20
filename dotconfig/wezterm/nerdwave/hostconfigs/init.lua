---@alias WallpaperConfig { prefix: string, wallpapers: table }
---@alias FonctConfig { size: number, family: string }
---@alias SessionizerConfig { fd: string, paths: string[] }
---@alias HostConfig { wallpaper: WallpaperConfig, font: FontConfig, sessionizer: SessionizerConfig}

---@type table<string, HostConfig>
local hostConfigs = {
  ['persephone'] = require('nerdwave.hostconfigs.persephone')
}

local function getHostConfig(hostname) return hostConfigs[hostname] end

return {
  getHostConfig = getHostConfig,
}
