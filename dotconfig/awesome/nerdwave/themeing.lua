local beautiful = require('beautiful')
local gears = require('gears')

---@param config AwesomeWMConfig
return function (config)
  -- Themes define colours, icons, font and wallpapers.
  beautiful.init(gears.filesystem.get_themes_dir() .. 'default/theme.lua')
  beautiful.useless_gap = config.gaps
  beautiful.gap_single_client = true
end
