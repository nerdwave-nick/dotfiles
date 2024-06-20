local awful = require('awful')
local beautiful = require('beautiful')
local config = require('nerdwave.config')
local hotkeys_popup = require('awful.hotkeys_popup')

local myawesomemenu = {
  { 'hotkeys', function() hotkeys_popup.show_help(nil, awful.screen.focused()) end },
  { 'manual', config.terminal .. ' -e man awesome' },
  { 'edit config', config:editor_cmd() .. ' ' .. awesome.conffile },
  { 'restart', awesome.restart },
  { 'quit', function() awesome.quit() end },
}
-- needs to be global to work with the shortcut
local mymainmenu = awful.menu({
  items = {
    { 'awesome', myawesomemenu, beautiful.awesome_icon },
    { 'open terminal', config.terminal },
  },
})
return mymainmenu
