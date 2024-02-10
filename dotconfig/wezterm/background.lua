local wezterm = require("wezterm")

local function setup(opts)
    local hostname = wezterm.hostname()
    local host_wallpaper_map = {
        ["debian"] = {
            prefix = os.getenv("HOME") .. "/Pictures/",
            wallpapers = {
                {
                    image = "backiee-257465-landscape.jpg",
                    hsb = {
                        brightness = 0.024,
                        hue = 1.0,
                        saturation = 1.0,
                    }
                },
                {
                    image = "alex-knight-5-GNa303REg-unsplash.jpg",
                    hsb = {
                        brightness = 0.030,
                        hue = 1.0,
                        saturation = 1.0,
                    }
                }
            },

        },
        ["HBV83038406"] = {
            prefix = os.getenv("HOME") .. "/Documents/",
            wallpapers = {
                {
                    image = "wp.jpg",
                    hsb = {
                        brightness = 0.025,
                        hue = 1.0,
                        saturation = 1.0,
                    }
                }
            }

        }
    }
    if host_wallpaper_map[hostname] ~= nil then
        local wallpaper_map = host_wallpaper_map[hostname]
        local prefix = wallpaper_map.prefix
        local wallpaper = wallpaper_map.wallpapers[math.random(#wallpaper_map.wallpapers)]
        opts.window_background_image = prefix .. wallpaper.image
        opts.window_background_image_hsb = wallpaper.hsb
    end
    opts.window_background_opacity = 1.00
    return opts
end

return {
    setup = setup,
}
