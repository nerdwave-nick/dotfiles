local wezterm = require("wezterm")

local function setup(opts)
	local hostname = wezterm.hostname()
	local wallpaper_prefix_map = {
		["debian"] = os.getenv("HOME") .. "/Pictures/",
		["HBV83038406"] = os.getenv("HOME") .. "/Documents/",
	}
	local wallpaper_map = {
		["debian"] = "alex-knight-5-GNa303REg-unsplash.jpg",
		["HBV83038406"] = "wp.jpg",
	}
	if wallpaper_prefix_map[hostname] ~= nil then
		opts.window_background_image = wallpaper_prefix_map[hostname] .. wallpaper_map[hostname]
		opts.window_background_image_hsb = {
			brightness = 0.025,
			hue = 1.0,
			saturation = 1.0,
		}
	end
	opts.window_background_opacity = 1.00
	return opts
end

return {
	setup = setup,
}
