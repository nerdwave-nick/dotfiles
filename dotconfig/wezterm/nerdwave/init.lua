local keybinds = require('nerdwave.keybinds').setup
-- local statusbar = require('nerdwave.lib.statusbar').setup
local theme = require('nerdwave.lib.theme').setup
local font = require('nerdwave.lib.font').setup
local wallpaper = require('nerdwave.lib.wallpaper').setup
local sessionizer = require('nerdwave.lib.sessionizer').setup

local aa = ' '
return function(hostname)
  local hostopts = require('nerdwave.hostconfigs').getHostConfig(hostname)
  local opts = {
    enable_wayland = true,
    front_end = 'OpenGL',
    window_decorations = 'NONE',
    default_prog = { hostopts.shell or 'bash' },
    window_padding = {
      left = 0,
      right = 0,
      top = 0,
      bottom = 0,
    },
    inactive_pane_hsb = {
      saturation = 1.0,
      brightness = 0.2,
      hue = 0.9,
    },
    adjust_window_size_when_changing_font_size = false,
    allow_square_glyphs_to_overflow_width = 'Always',
    use_resize_increments = false,
    default_cursor_style = 'BlinkingBar',
    enable_scroll_bar = false,
    check_for_updates = false,
    enable_tab_bar = false,
  }
  if hostopts.initial_cols ~= nil then opts.initial_cols = hostopts.initial_cols end
  if hostopts.initial_rows ~= nil then opts.initial_rows = hostopts.initial_rows end
  sessionizer(hostopts.sessionizer)
  opts = theme(opts)
  opts = font(opts, hostopts.font)
  opts = wallpaper(opts, hostopts.wallpaper)
  opts = keybinds(opts)
  -- opts = statusbar(opts, hostopts)
  return opts
end
