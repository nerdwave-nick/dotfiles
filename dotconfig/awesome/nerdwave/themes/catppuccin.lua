local config = require "nerdwave.config"
return function()
  local rnotification = require('ruled.notification')
  local theme_assets = require('beautiful.theme_assets')
  local beautiful = require('beautiful')
  local dpi = beautiful.xresources.apply_dpi

  local gfs = require('gears.filesystem')
  local themes_path = gfs.get_themes_dir()

  local theme = {}

  theme.font = 'Ubuntu Nerd Font Semibold 9'
  -- theme.font = 'Noto Sans Semibold 9'

  theme.useless_gap = dpi(5)
  theme.border_width = dpi(1)
  theme.black = '#1e1e28'
  theme.deep_black = '#1b1923'
  theme.white = '#d7dae0'
  theme.light_white = '#fafafa'
  theme.pink = '#f0afe1'
  theme.red = '#e28c8c'
  theme.orange = '#f9c096'
  theme.yellow = '#eadda0'
  theme.green = '#b3e1a3'
  theme.blue = '#a4b9ef'
  theme.purple = '#c6aae8'
  theme.grey = '#6e6c7c'
  theme.black_transparent = theme.black .. 'bb'
  theme.deep_black_transparent = theme.deep_black .. 'df'

  theme.bg_normal = theme.black_transparent
  theme.bg_focus = theme.deep_black_transparent
  theme.bg_urgent = theme.yellow
  theme.bg_minimize = theme.grey
  theme.bg_systray = theme.black_transparent

  theme.fg_normal = theme.white
  theme.fg_focus = theme.pink
  theme.fg_urgent = theme.black
  theme.fg_minimize = theme.light_white

  theme.border_normal = theme.blue
  theme.border_focus = theme.green
  theme.border_marked = theme.purple

  theme.tasklist_bg_normal = theme.purple
  theme.tasklist_bg_focus = theme.green
  theme.tasklist_bg_urgent = theme.yellow

  theme.taglist_bg_focus = '#00000000'
  theme.taglist_bg_occupied = '#00000000'
  theme.taglist_bg_empty = '#00000000'
  theme.taglist_bg_urgent = theme.yellow
  -- theme.taglist_bg_occupied = theme.black -- :w '#ffffff' -- theme.black .. 'ff'

  -- There are other variable sets
  -- overriding the default one when
  -- defined, the sets are:
  -- taglist_[bg|fg]_[focus|urgent|occupied|empty|volatile]
  -- tasklist_[bg|fg]_[focus|urgent]
  -- titlebar_[bg|fg]_[normal|focus]
  -- tooltip_[font|opacity|fg_color|bg_color|border_width|border_color]
  -- mouse_finder_[color|timeout|animate_timeout|radius|factor]
  -- prompt_[fg|bg|fg_cursor|bg_cursor|font]
  -- hotkeys_[bg|fg|border_width|border_color|shape|opacity|modifiers_fg|label_bg|label_fg|group_margin|font|description_font]
  -- Example:
  -- theme.taglist_bg_focus = "#ff0000"

  -- Generate taglist squares:
  local taglist_square_size = dpi(4)
  theme.taglist_squares_sel = theme_assets.taglist_squares_sel(taglist_square_size, theme.border_focus)
  theme.taglist_squares_unsel = theme_assets.taglist_squares_sel(taglist_square_size, theme.border_marked)
  theme.taglist_disable_icon = true

  -- Variables set for theming notifications:
  theme.notification_font = 'Ubuntu Nerd Font 12'
  theme.notification_margin = dpi(10)
  theme.notification_border_color = theme.border_normal
  theme.notification_border_width = theme.border_width
  theme.notification_icon_size = dpi(60)

  -- notification_[bg|fg]
  -- notification_[width|height|margin]
  -- notification_[border_color|border_width|shape|opacity]

  -- Variables set for theming the menu:
  -- menu_[bg|fg]_[normal|focus]
  -- menu_[border_color|border_width]
  theme.menu_submenu_icon = themes_path .. 'default/submenu.png'
  theme.menu_height = dpi(15)
  theme.menu_width = dpi(100)

  -- You can add as many variables as
  -- you wish and access them by using
  -- beautiful.variable in your rc.lua
  --theme.bg_widget = "#cc0000"

  -- Define the image to load
  theme.titlebar_close_button_normal = themes_path .. 'default/titlebar/close_normal.png'
  theme.titlebar_close_button_focus = themes_path .. 'default/titlebar/close_focus.png'

  theme.titlebar_minimize_button_normal = themes_path .. 'default/titlebar/minimize_normal.png'
  theme.titlebar_minimize_button_focus = themes_path .. 'default/titlebar/minimize_focus.png'

  theme.titlebar_ontop_button_normal_inactive = themes_path .. 'default/titlebar/ontop_normal_inactive.png'
  theme.titlebar_ontop_button_focus_inactive = themes_path .. 'default/titlebar/ontop_focus_inactive.png'
  theme.titlebar_ontop_button_normal_active = themes_path .. 'default/titlebar/ontop_normal_active.png'
  theme.titlebar_ontop_button_focus_active = themes_path .. 'default/titlebar/ontop_focus_active.png'

  theme.titlebar_sticky_button_normal_inactive = themes_path .. 'default/titlebar/sticky_normal_inactive.png'
  theme.titlebar_sticky_button_focus_inactive = themes_path .. 'default/titlebar/sticky_focus_inactive.png'
  theme.titlebar_sticky_button_normal_active = themes_path .. 'default/titlebar/sticky_normal_active.png'
  theme.titlebar_sticky_button_focus_active = themes_path .. 'default/titlebar/sticky_focus_active.png'

  theme.titlebar_floating_button_normal_inactive = themes_path .. 'default/titlebar/floating_normal_inactive.png'
  theme.titlebar_floating_button_focus_inactive = themes_path .. 'default/titlebar/floating_focus_inactive.png'
  theme.titlebar_floating_button_normal_active = themes_path .. 'default/titlebar/floating_normal_active.png'
  theme.titlebar_floating_button_focus_active = themes_path .. 'default/titlebar/floating_focus_active.png'

  theme.titlebar_maximized_button_normal_inactive = themes_path .. 'default/titlebar/maximized_normal_inactive.png'
  theme.titlebar_maximized_button_focus_inactive = themes_path .. 'default/titlebar/maximized_focus_inactive.png'
  theme.titlebar_maximized_button_normal_active = themes_path .. 'default/titlebar/maximized_normal_active.png'
  theme.titlebar_maximized_button_focus_active = themes_path .. 'default/titlebar/maximized_focus_active.png'

  theme.wallpaper = themes_path .. 'default/background.png'

  -- You can use your own layout icons like this:
  theme.layout_fairh = themes_path .. 'default/layouts/fairhw.png'
  theme.layout_fairv = themes_path .. 'default/layouts/fairvw.png'
  theme.layout_floating = themes_path .. 'default/layouts/floatingw.png'
  theme.layout_magnifier = themes_path .. 'default/layouts/magnifierw.png'
  theme.layout_max = themes_path .. 'default/layouts/maxw.png'
  theme.layout_fullscreen = themes_path .. 'default/layouts/fullscreenw.png'
  theme.layout_tilebottom = themes_path .. 'default/layouts/tilebottomw.png'
  theme.layout_tileleft = themes_path .. 'default/layouts/tileleftw.png'
  theme.layout_tile = themes_path .. 'default/layouts/tilew.png'
  theme.layout_tiletop = themes_path .. 'default/layouts/tiletopw.png'
  theme.layout_spiral = themes_path .. 'default/layouts/spiralw.png'
  theme.layout_dwindle = themes_path .. 'default/layouts/dwindlew.png'
  theme.layout_cornernw = themes_path .. 'default/layouts/cornernww.png'
  theme.layout_cornerne = themes_path .. 'default/layouts/cornernew.png'
  theme.layout_cornersw = themes_path .. 'default/layouts/cornersww.png'
  theme.layout_cornerse = themes_path .. 'default/layouts/cornersew.png'

  -- Generate Awesome icon:
  theme.awesome_icon = theme_assets.awesome_icon(theme.menu_height, theme.bg_focus, theme.fg_focus)

  -- Define the icon theme for application icons. If not set then the icons
  -- from /usr/share/icons and /usr/share/icons/hicolor will be used.
  theme.icon_theme = '/usr/share/icons/Papirus-Dark'
  -- theme.wallpaper = '~/dotfiles/feh/images/cherry_blossoms.jpg'
  -- theme.wallpaper = '~/dotfiles/feh/images/shaded_landscape.jpg'
  theme.wallpaper = config.wallpaper

  -- Set different colors for urgent notifications.
  rnotification.connect_signal(
    'request::rules',
    function()
      rnotification.append_rule({
        rule = { urgency = 'critical' },
        properties = { bg = beautiful.red,  fg = beautiful.white },
      })
    end
  )

  return theme
end
