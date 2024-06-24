local awful = require('awful')
local beautiful = require('beautiful')
local gears = require('gears')
local tags = require('nerdwave.ui.sidebar.tags')
local top = require('nerdwave.ui.sidebar.top')
local wibox = require('wibox')

local dpi = beautiful.xresources.apply_dpi

---@param config AwesomeWMConfig
return function(config)
  local M = {}
  function M:new(s)
    tags.setupTags(s)
    local mytextclock = wibox.widget.textclock('%l:%M %p', 60)

    s.mylayoutbox = wibox.container.margin(
      awful.widget.layoutbox({
        screen = s,
        buttons = {
          awful.button({}, 1, function() awful.layout.inc(1) end),
          awful.button({}, 3, function() awful.layout.inc(-1) end),
          awful.button({}, 4, function() awful.layout.inc(-1) end),
          awful.button({}, 5, function() awful.layout.inc(1) end),
        },
      }),
      0,
      dpi(2.5),
      dpi(2.5),
      dpi(2.5)
    )
    s.mytasklist = awful.widget.tasklist({
      screen = s,
      filter = awful.widget.tasklist.filter.currenttags,
      buttons = {
        awful.button({}, 1, function(c) c:activate({ context = 'tasklist', action = 'toggle_minimization' }) end),
        awful.button({}, 2, function(c) c:kill() end),
        awful.button({}, 3, function() awful.menu.client_list({ theme = { width = dpi(250) } }) end),
        awful.button({}, 4, function() awful.client.focus.byidx(-1) end),
        awful.button({}, 5, function() awful.client.focus.byidx(1) end),
      },
      layout = {
        spacing_widget = {
          {
            forced_width = 5,
            forced_height = 24,
            thickness = 1,
            color = beautiful.purple .. '1b', --'#777777',
            widget = wibox.widget.separator,
          },
          valign = 'center',
          halign = 'center',
          widget = wibox.container.place,
        },
        spacing = dpi(3),
        layout = wibox.layout.fixed.horizontal,
      },
      widget_template = {
        layout = wibox.layout.align.vertical,
        {
          wibox.widget.base.make_widget(),
          forced_height = dpi(2),
          id = 'background_role',
          widget = wibox.container.background,
        },
        {
          awful.widget.clienticon,
          margins = 1,
          widget = wibox.container.margin,
        },
        nil,
      },
    })

    local my_round_systray = {
      wibox.widget.systray(),
      left = 10,
      top = 2,
      bottom = 2,
      right = 10,
      widget = wibox.container.margin,
    }
    local leftwidgets = top.getWidgets(s, config)
    local sgeo = s.geometry
    local function create_top_bars(lbar, lsize, mbar, msize, rbar, rsize, height, marginLeft, marginRight, marginTop)
      lbar.height = dpi(height)
      lbar.width = dpi(lsize)
      lbar.x = dpi(marginLeft)
      lbar.y = dpi(marginTop)

      mbar.height = dpi(height)
      mbar.width = dpi(msize)
      mbar.x = sgeo.width / 2 - dpi(msize / 2)
      mbar.y = dpi(marginTop)

      rbar.height = dpi(height)
      rbar.width = dpi(rsize)
      rbar.x = sgeo.width - dpi(rsize + marginRight)
      rbar.y = dpi(marginTop)

      s.leftbar = wibox(lbar)

      s.midbar = wibox(mbar)

      s.rightbar = wibox(rbar)

      s.mywibox = awful.wibar({
        bg = '#00000000',
        position = 'top',
        height = dpi(height + marginTop),
        screen = s,
      })
    end
    local lbar = {
      border_width = dpi(1.0),
      border_color = beautiful.deep_black,
      ontop = true,
      visible = true,
      type = 'bar',
      screen = s,
      shape = gears.shape.rounded_bar,
      bg = beautiful.deep_black_transparent,
      widget = {
        widget = wibox.container.margin,
        margins = {
          left = dpi(12),
          right = dpi(12),
        },
        leftwidgets.mytaglist,
      },
    }
    local mbar = {
      border_width = dpi(1.0),
      border_color = beautiful.deep_black,
      ontop = true,
      visible = true,
      type = 'bar',
      screen = s,
      shape = gears.shape.rounded_bar,
      bg = beautiful.deep_black_transparent,
      widget = {
        widget = wibox.container.margin,
        margins = {
          left = dpi(12),
          right = dpi(2),
        },
        {
          layout = wibox.layout.align.horizontal,
          s.mytasklist,
          nil,
          leftwidgets.todo_widget,
        },
      },
    }
    local rbar = {
      border_width = dpi(1.0),
      border_color = beautiful.deep_black,
      ontop = true,
      visible = true,
      type = 'bar',
      screen = s,
      shape = gears.shape.rounded_bar,
      bg = beautiful.deep_black_transparent,
      widget = {
        widget = wibox.container.margin,
        margins = {
          left = dpi(2),
          right = dpi(5),
          top = dpi(2),
          bottom = dpi(2),
        },
        {
          widget = wibox.layout.align.horizontal,
          nil,
          my_round_systray,
          {
            widget = wibox.layout.fixed.horizontal,
            spacing = dpi(6),
            leftwidgets.brightness_widget,
            leftwidgets.volume_widget,
            leftwidgets.batteryarc_widget,
            leftwidgets.wireless_widget,
            mytextclock,
            s.mylayoutbox,
            leftwidgets.launcher,
          },
        },
      },
    }
    create_top_bars(mbar, 350, lbar, 227 + 2 / 3, rbar, 350, 25, 10, 10, 5)

    -- to block off the top of the screen
  end

  return M
end
