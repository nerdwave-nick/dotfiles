local awful = require('awful')
local batteryarc_widget = require('awesome-wm-widgets.batteryarc-widget.batteryarc')
local beautiful = require('beautiful')
local brightness_widget = require('awesome-wm-widgets.brightness-widget.brightness')
local mymainmenu = require('nerdwave.ui.components.main-menu')
local net_widgets = require('net_widgets')
local volume_widget = require('awesome-wm-widgets.volume-widget.volume')
local wibox = require('wibox')
local dpi = beautiful.xresources.apply_dpi
local todo_widget = require('awesome-wm-widgets.todo-widget.todo')
local M = {}
---@param config AwesomeWMConfig
function M.getWidgets(s, config)
  local widgets = {}
  widgets.launcher = awful.widget.launcher({ image = beautiful.awesome_icon, menu = mymainmenu })
  -- Create a taglist widget
  widgets.mytaglist = awful.widget.taglist({
    screen = s,
    filter = awful.widget.taglist.filter.all,
    buttons = {
      awful.button({}, 1, function(t) t:view_only() end),
      awful.button({ config.modifier }, 1, function(t)
        if client.focus then client.focus:move_to_tag(t) end
      end),
      awful.button({}, 3, awful.tag.viewtoggle),
      awful.button({ config.modifier }, 3, function(t)
        if client.focus then client.focus:toggle_tag(t) end
      end),
      awful.button({}, 4, function(t) awful.tag.viewprev(t.screen) end),
      awful.button({}, 5, function(t) awful.tag.viewnext(t.screen) end),
    },
  })
  -- table.insert(widgets, {
  --   widget = wibox.container.background,
  --   {
  --     widget = wibox.container.margin,
  --     margins = {
  --       top = 3,
  --       bottom = 3,
  --       left = 12,
  --       right = 12,
  --     },
  --     {
  --       layout = wibox.layout.fixed.horizontal,
  --       spacing = dpi(6),
  -- s.mytaglist,
  widgets.brightness_widget = brightness_widget({
    timeout = 10,
    tooltip = true,
  })
  widgets.volume_widget = volume_widget({
    widget_type = 'arc',
    device = 'pipewire',
    size = dpi(13),
    main_color = beautiful.green,
    mute_color = beautiful.pink,
    bg_color = beautiful.black,
  })
  widgets.batteryarc_widget = batteryarc_widget({
    -- show_current_level = true,
    size = dpi(16),
    timeout = 3,
    arc_thickness = dpi(2),
    low_level_color = beautiful.red,
    medium_level_color = beautiful.orange,
    charging_color = beautiful.pink,
    bg_color = beautiful.black,
    main_color = beautiful.pink,
  })
  widgets.wireless_widget = wibox.container.margin({
    widget = net_widgets.wireless({ interface = 'wlan0', onclick = 'rofi-wifi-menu', popup_signal = true }),
    top = 5,
    bottom = 5,
    left = 0,
    right = 0,
    force_height = dpi(1),
    draw_empty = true,
  })
  widgets.todo_widget = todo_widget()
  -- },
  --   },
  --   bg = beautiful.bg_normal,
  --   shape = gears.shape.rounded_bar,
  --   border_width = dpi(2.8),
  --   border_color = beautiful.deep_black .. 'cb',
  --   -- border_width = dpi(0.5),
  --   -- border_color = beautiful.purple,
  -- })
  return widgets
end
return M
