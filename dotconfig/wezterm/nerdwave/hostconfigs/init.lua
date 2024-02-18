---@alias WallpaperConfig { prefix: string, wallpapers: table }
---@alias FonctConfig { size: number, family: string }
---@alias SessionizerConfig { fd: string, paths: string[] }
---@alias HostConfig { wallpaper: WallpaperConfig, font: FontConfig, sessionizer: SessionizerConfig}

---@type table<string, HostConfig>
local hostConfigs = {
    ["debian"] = require("nerdwave.hostconfigs.debian-vm"),
    ["HBV83038406"] = require("nerdwave.hostconfigs.macos-work"),
    ["Ishtar"] = require("nerdwave.hostconfigs.ishtar-wsl")
}

local function getHostConfig(hostname)
    return hostConfigs[hostname]
end

return {
    getHostConfig = getHostConfig
}
