local wezterm = require("wezterm")
local theme = require("theme")
-- Thanks to winston for a lot of this config :)
-- Look for more of his setup at https://github.com/nekowinston/dotfiles
local hostname = wezterm.hostname()
local wallpaper_prefix_map = {
	["debian"] = "/home/nerdwave/Pictures/",
	["HBV83038406"] = "/Users/nick.mueller/Documents/",
}
local wallpaper_map = {
	["debian"] = "alex-knight-5-GNa303REg-unsplash.jpg",
	["HBV83038406"] = "wp.jpg",
}

require("bar").setup({
	dividers = "slant_left", -- or "slant_left", "arrows", "rounded", false
	indicator = {
		leader = {
			enabled = true, --true,
			off = " ",
			on = " ",
		},
		mode = {
			enabled = true, --true,
			names = {
				resize_mode = "RESIZE",
				copy_mode = "VISUAL",
				search_mode = "SEARCH",
			},
		},
	},
	tabs = {
		--   -- numerals = "roman", --arabic", -- or "roman"
		numerals = "arabic", --arabic", -- or "roman"
		pane_count = "superscript", -- or "subscript", false
		brackets = {
			active = { "", ":" },
			inactive = { "", ":" },
		},
	},
	clock = { -- note that this overrides the whole set_right_status
		-- enabled = false,
		enabled = true,
		format = "%H:%M", -- use https://wezfurlong.org/wezterm/config/lua/wezterm.time/Time/format.html
	},
})

wezterm.GLOBAL = {
	font = "cartograph",
	enable_tar_bar = true,
}
local font = require("fonts").get_font(wezterm.GLOBAL.font)

local opts = {
	front_end = "OpenGL",
	font = font.font,
	font_size = font.size,
	window_decorations = "RESIZE",
	window_padding = {
		left = 10,
		right = 10,
		top = 10,
		bottom = 10,
	},
	inactive_pane_hsb = {
		saturation = 1.0,
		brightness = 0.2,
		hue = 0.9,
	},
	color_schemes = theme.custom_colorscheme(),
	color_scheme = theme.scheme_for_appearance(wezterm.gui.get_appearance(), {
		dark = "Catppuccin Americano",
		light = "Catppuccin Latte",
	}),
	tab_bar_at_bottom = true,
	tab_max_width = 22,
	use_fancy_tab_bar = false,
	window_background_opacity = 1.00,
	window_background_image = wallpaper_prefix_map[hostname] .. wallpaper_map[hostname],
	window_background_image_hsb = {
		brightness = 0.025,
		hue = 1.0,
		saturation = 1.0,
	},
	hide_tab_bar_if_only_one_tab = false,
	enable_tar_bar = wezterm.GLOBAL.tab_bar_hidden,
	adjust_window_size_when_changing_font_size = false,
	use_resize_increments = false,
	-- audible_bell = "Disabled",
	clean_exit_codes = { 130 },
	default_cursor_style = "BlinkingBar",
	enable_scroll_bar = false,
	check_for_updates = false,
}
for k, v in pairs(require("keybindings")) do
	opts[k] = v
end

local workspaces = require("workspaces")

wezterm.on("gui-startup", function()
	workspaces.loadWorkspaces()
end)

wezterm.on("save-workspaces", function()
	local activeWorkspace = wezterm.mux.get_active_workspace()
	print(wezterm.mux.all_windows())
	for _, window in ipairs(wezterm.mux.all_windows()) do
		if window:get_workspace() == activeWorkspace then
			window:gui_window():toast_notification("(Workspaces)", "Saving workspaces...", nil, 5000)
		end
	end
	workspaces.saveWorkspaces()
end)

return opts
