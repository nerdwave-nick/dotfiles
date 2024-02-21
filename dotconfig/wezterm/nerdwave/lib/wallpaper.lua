---@param opts table
---@param wallpaperConfig WallpaperConfig
local function setup(opts, wallpaperConfig)
  if wallpaperConfig ~= nil then
    local prefix = wallpaperConfig.prefix
    local wallpaper = wallpaperConfig.wallpapers[math.random(#wallpaperConfig.wallpapers)]
    opts.window_background_image = prefix .. wallpaper.image
    opts.window_background_image_hsb = wallpaper.hsb
  end
  opts.window_background_opacity = 1.00
  return opts
end

return {
  setup = setup,
}
