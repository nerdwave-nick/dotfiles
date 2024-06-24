-- Standard awesome library
local awful = require('awful')
-- require('awful.autofocus')
-- Widget and layout library
local wibox = require('wibox')
-- Theme handling library
local beautiful = require('beautiful')
-- custom
local config = require('nerdwave.config')
local gears = require('gears')
local menubar = require('menubar')
local ruled = require('ruled')
local sidebar = require('nerdwave.ui.sidebar')(config)

local dpi = beautiful.xresources.apply_dpi

-- automatic focus on mouse hover
require('awful.autofocus')

menubar.utils.terminal = config.terminal -- Set the terminal for applications that require it

screen.connect_signal(
  'request::wallpaper',
  function(s)
    awful.wallpaper({
      screen = s,
      widget = {
        image = beautiful.wallpaper,
        upscale = true,
        downscale = true,
        widget = wibox.widget.imagebox,
        valign = 'center',
        halign = 'center',
        vertical_fit_policy = 'fit',
        horizontal_fit_policy = 'fit',
        tiled = false,
      },
    })
  end
)

-- Rules to apply to new clients.
ruled.client.connect_signal('request::rules', function()
  -- All clients will match this rule.
  ruled.client.append_rule({
    id = 'global',
    rule = {},
    properties = {
      focus = awful.client.focus.filter,
      raise = true,
      screen = awful.screen.preferred,
      placement = awful.placement.no_overlap + awful.placement.no_offscreen,
    },
  })

  -- Set Firefox to always map on the tag named "2" on screen 1.
  ruled.client.append_rule({
    rule = { class = 'firefox' },
    properties = { tag = ' ' },
  })
  ruled.client.append_rule({
    rule = { class = '1Password' },
    properties = { tag = ' ' },
  })
  ruled.client.append_rule({
    rule = { class = 'Google-chrome' },
    properties = { tag = ' ' },
  })
  ruled.client.append_rule({
    rule = { class = 'discord' },
    properties = { tag = '  ' },
  })
end)

ruled.notification.connect_signal('request::rules', function()
  -- All notifications will match this rule.
  ruled.notification.append_rule({
    rule = {},
    properties = {
      screen = awful.screen.preferred,
      implicit_timeout = 5,
    },
  })
end)

client.connect_signal('manage', function(c)
  -- to make new windows go right
  if not awesome.startup then awful.client.setslave(c) end
  c.shape = function(cr, w, h) gears.shape.rounded_rect(cr, w, h, dpi(8)) end
end)

-- Enable sloppy focus, so that focus follows mouse.
client.connect_signal(
  'mouse::enter',
  function(c) c:emit_signal('request::activate', 'mouse_enter', { raise = false }) end
)

-- focus border color
client.connect_signal('focus', function(c) c.border_color = beautiful.border_focus end)
client.connect_signal('unfocus', function(c) c.border_color = beautiful.border_normal end)
-- setting up sidebar
screen.connect_signal('request::desktop_decoration', function(s) sidebar:new(s) end)
