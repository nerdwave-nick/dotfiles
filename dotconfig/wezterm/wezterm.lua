local theme = require("theme")
local keybinds = require("keybinds")
local statusbar = require("statusbar")
local background = require("background")
local font = require("fonts")

local opts = {
	front_end = "OpenGL",
	window_decorations = "RESIZE",
	window_padding = {
		left = 10,
		right = 10,
		top = 15,
		bottom = 10,
	},
	inactive_pane_hsb = {
		saturation = 1.0,
		brightness = 0.2,
		hue = 0.9,
	},
	adjust_window_size_when_changing_font_size = false,
	use_resize_increments = false,
	default_cursor_style = "BlinkingBar",
	enable_scroll_bar = false,
	check_for_updates = true,
}

theme.setup(opts)
statusbar.setup(opts)
keybinds.setup(opts)
font.setup(opts)
background.setup(opts)

return opts
