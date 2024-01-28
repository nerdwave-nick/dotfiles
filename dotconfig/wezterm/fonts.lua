local wezterm = require("wezterm")

local F = {}
local fonts = {
	fira = {
		font = {
			family = "FiraCode Nerd Font",
			harfbuzz_features = {
				"clig=1",
				"cv06=1",
				"cv14=1",
				"cv32=1",
				"ss04=1",
				"ss07=1",
				"ss09=1",
			},
		},
		size = 15,
	},
}
F.setup = function(opts)
	opts.font = wezterm.font_with_fallback({
		fonts.fira.font,
		"Noto Sans Emoji",
	})
	opts.font_size = fonts.fira.size
	return opts
end

return F
