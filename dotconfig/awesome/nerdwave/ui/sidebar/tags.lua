local awful = require('awful')

local M = {}
function M.setupTags(s)
  awful.tag.add(' ', {
    layout = awful.layout.suit.spiral.dwindle,
    gap_single_client = true,
    screen = s,
  })

  awful.tag.add(' ', {
    layout = awful.layout.suit.spiral.dwindle,
    gap_single_client = true,
    screen = s,
    selected = true,
  })

  awful.tag.add(' ', {
    layout = awful.layout.suit.spiral.dwindle,
    gap_single_client = true,
    screen = s,
  })

  awful.tag.add(' ', {
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

  awful.tag.add(' ', {
    layout = awful.layout.suit.spiral.dwindle,
    gap_single_client = true,
    screen = s,
  })

  awful.tag.add(' ', {
    layout = awful.layout.suit.spiral.dwindle,
    gap_single_client = true,
    screen = s,
  })
end
return M
