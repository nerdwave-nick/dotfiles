local theme = require("theme").setup
local keybinds = require("keybinds").setup
local statusbar = require("statusbar").setup
local background = require("background").setup
local font = require("fonts").setup

require("sessionizer").setup("/usr/bin/fdfind", { os.getenv("HOME") .. "/repos", os.getenv("HOME") .. "/dotfiles" })

return statusbar(keybinds(background(font(theme({
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
})))))
