local awful = require('awful')
local beautiful = require('beautiful')
local gears = require('gears')
local mymainmenu = require('nerdwave.ui.components.main-menu')
local top = require('nerdwave.ui.sidebar.top')
local wibox = require('wibox')

local dpi = beautiful.xresources.apply_dpi

---@param config AwesomeWMConfig
return function(config)
  local M = {}
  function M:new(s)
    -- Each screen has its own tag table.
    top.getTop(s)
    -- awful.tag({ 'term', 'ffx', '7', '6' }, s, awful.layout.layouts[1])
    --
    -- Create a launcher widget and a main menu

    local mylauncher = awful.widget.launcher({ image = beautiful.awesome_icon, menu = mymainmenu })

    local mytextclock = wibox.widget.textclock()

    -- Create a promptbox for each screen
    s.mypromptbox = awful.widget.prompt()

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

    -- Create a taglist widget
    s.mytaglist = awful.widget.taglist({
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

    -- Create the wibox
    s.mywibox = awful.wibox({
      shape = function(cr, w, h) gears.shape.rounded_rect(cr, w, h, dpi(5)) end,
      border_width = beautiful.get().border_width / 2,
      border_color = beautiful.get().purple,
      position = 'left',
      margins = {
        -- right=dpi(10),
        -- left=dpi(10),
        top = dpi(5),
        bottom = dpi(5),
      },
      screen = s,
      widget = {
        layout = wibox.layout.rotate,
        direction = 'east',
        {
          layout = wibox.layout.align.horizontal,
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
          s.mytasklist, -- Middle widget
          { -- Left widgets
            layout = wibox.layout.fixed.horizontal,
            s.mypromptbox,
            s.mytaglist,
            mylauncher,
          },
        },
      },
    })
  end

  return M
end
