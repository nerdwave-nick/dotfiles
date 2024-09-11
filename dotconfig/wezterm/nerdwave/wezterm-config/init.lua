local keybinds = require('nerdwave.wezterm-config.keybinds').setup
local statusbar = require('nerdwave.wezterm-config.lib.statusbar').setup
local theme = require('nerdwave.wezterm-config.lib.theme').setup
local font = require('nerdwave.wezterm-config.lib.font').setup
local wallpaper = require('nerdwave.wezterm-config.lib.wallpaper').setup
local sessionizer = require('nerdwave.wezterm-config.lib.sessionizer').setup

return function(hostname)
  local hostopts = require('nerdwave.wezterm-config.hostconfigs').getHostConfig(hostname)
  local opts = {
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
      brightness = 0.3,
      hue = 1.0,
    },
    adjust_window_size_when_changing_font_size = true,
    default_cursor_style = 'SteadyBlock',
    force_reverse_video_cursor = true,
    enable_scroll_bar = false,
    check_for_updates = false,
    enable_tab_bar = false,
    hide_tab_bar_if_only_one_tab = false,
    term = 'wezterm',
    underline_thickness = '1pt',
  }
  if hostopts.initial_cols ~= nil then opts.initial_cols = hostopts.initial_cols end
  if hostopts.initial_rows ~= nil then opts.initial_rows = hostopts.initial_rows end

  sessionizer(hostopts.sessionizer)
  opts = theme(opts)
  opts = font(opts, hostopts.font)
  opts = wallpaper(opts, hostopts.wallpaper)
  opts = keybinds(opts)
  opts = statusbar(opts, hostopts)
  return opts
end
