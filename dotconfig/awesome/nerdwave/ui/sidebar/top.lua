local awful = require('awful')
local wibox = require('wibox')
local mymainmenu = require('nerdwave.ui.components.main-menu')
local beautiful = require('beautiful')
local M = {}
function M.setupTags(s)
    awful.tag.add(' ', {
        layout = awful.layout.suit.spiral.dwindle,
        gap_single_client = true,
        screen = s,
    })

    awful.tag.add(" ", {
        layout = awful.layout.suit.spiral.dwindle,
        gap_single_client = true,
        screen = s,
        selected = true
    })

    awful.tag.add(" ", {
        layout = awful.layout.suit.spiral.dwindle,
        gap_single_client = true,
        screen = s,
        selected = true
    })

    awful.tag.add(' ', {
        layout = awful.layout.suit.spiral.dwindle,
        gap_single_client = true,
        screen = s,
    })

    awful.tag.add('󰭻 ', {
        layout = awful.layout.suit.spiral.dwindle,
        gap_single_client = true,
        screen = s,
    })

    awful.tag.add(' ', {
        layout = awful.layout.suit.spiral.dwindle,
        gap_single_client = true,
        screen = s,
    })

    awful.tag.add(' ', {
        layout = awful.layout.suit.spiral.dwindle,
        gap_single_client = true,
        screen = s,
    })
end
---@param config AwesomeWMConfig
function M.insertWidgets(s, widgets, config)
    local mylauncher = awful.widget.launcher({ image = beautiful.awesome_icon, menu = mymainmenu })
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
    table.insert(widgets, s.mytasklist)
    table.insert(widgets, { -- Left widgets
            layout = wibox.layout.fixed.horizontal,
            s.mytaglist,
            mylauncher,
          })

end
return M
