local wezterm = require('wezterm')

local scheme_for_appearance = function()
  if wezterm.gui.get_appearance():find('Dark') then
    return 'Catppuccin Mocha'
  else
    return 'Catppuccin Latte'
  end
end

local function setup(opts)
  opts.color_scheme = scheme_for_appearance()
  return opts
end

return {
  setup = setup,
}
