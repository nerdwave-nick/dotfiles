local awful = require('awful')
local beautiful = require('beautiful')
local gears = require('gears')
local top = require('nerdwave.ui.sidebar.top')
local wibox = require('wibox')

local dpi = beautiful.xresources.apply_dpi

---@param config AwesomeWMConfig
return function(config)
  local M = {}
  function M:new(s)
    -- Each screen has its own tag table.
    top.setupTags(s)
    -- awful.tag({ 'term', 'ffx', '7', '6' }, s, awful.layout.layouts[1])
    --
    -- Create a launcher widget and a main menu

    local mytextclock = wibox.widget.textclock()

    -- Create a promptbox for each screen
    -- s.mypromptbox = awful.widget.prompt()

    -- Create an imagebox widget which will contain an icon indicating which layout we're using.
    -- We need one layoutbox per screen.
    s.mylayoutbox = awful.widget.layoutbox({
      screen = s,
      buttons = {
        awful.button({}, 1, function() awful.layout.inc(1) end),
        awful.button({}, 3, function() awful.layout.inc(-1) end),
        awful.button({}, 4, function() awful.layout.inc(-1) end),
        awful.button({}, 5, function() awful.layout.inc(1) end),
      },
    })

    -- Create a tasklist widget
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
    })
    local widgets = {
      layout = wibox.layout.align.horizontal,
      margins = {
        -- right=dpi(10),
        -- left=dpi(10),
        top = dpi(5),
        bottom = dpi(5),
      },
      { -- Right widgets
        layout = wibox.layout.align.horizontal,
        -- mykeyboardlayout,
        nil,
        nil,
        {
          s.mylayoutbox,
          mytextclock,
          wibox.widget.systray(),
          layout = wibox.layout.fixed.horizontal,
        },
      },
    }

    top.insertWidgets(s, widgets, config)

    local widget = {
      layout = wibox.layout.rotate,
      direction = 'east',
      ['0'] = widgets,
    }
    table.insert(widget, widgets)

    -- Create the wibox
    s.mywibox = awful.wibar({
      shape = function(cr, w, h) gears.shape.rounded_rect(cr, w, h, dpi(5)) end,
      border_width = beautiful.get().border_width / 2,
      border_color = beautiful.get().purple,
      position = 'left',
      -- stretch=false,
      -- width=120,
      -- margins = {
      --   right=dpi(10),
      --   left=dpi(10),
      --   top = dpi(5),
      --   bottom = dpi(5),
      -- },
      screen = s,
      widget = widget,
    })
  end

  return M
end
