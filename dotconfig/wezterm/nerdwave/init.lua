local keybinds = require("nerdwave.keybinds").setup
local statusbar = require("nerdwave.lib.statusbar").setup
local theme = require("nerdwave.lib.theme").setup
local font = require("nerdwave.lib.font").setup
local wallpaper = require("nerdwave.lib.wallpaper").setup
local sessionizer = require("nerdwave.lib.sessionizer").setup

return function(hostname)
    local hostopts = require("nerdwave.hostconfigs").getHostConfig(hostname)
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
        check_for_updates = false,
    }
    sessionizer(hostopts.sessionizer)
    return statusbar(keybinds(wallpaper(font(theme(opts), hostopts.font), hostopts.wallpaper)))
end
